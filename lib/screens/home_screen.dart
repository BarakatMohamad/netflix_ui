import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
import '../constants/constants.dart';
import '../data/data.dart';
import '../widgets/all_movies.dart';
import '../widgets/content_header.dart';
import '../widgets/content_list.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/previews.dart';
import '../widgets/trending.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _scrollOffSet = 0.0;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _scrollOffSet = _scrollController.offset;
          fetchMovies();
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  ///TMDB api key
  final String apiKey = '64f02ab32f694b555ca91cfb80966fe5';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2NGYwMmFiMzJmNjk0YjU1NWNhOTFjZmI4MDk2NmZlNSIsInN1YiI6IjYyY2ZlMDc1MGI1ZmQ2MDA1Mzg3YWEwOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7CqpwwqegxDfN1RQwwWTinQzPbxpd4GKSLnbXe5w-s8';
  List trendingMovies = [];
  List topRated = [];
  List tvShows = [];
  List upComing = [];

  ///fetches data from the tmdb api
  fetchMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(
      ///ApiKeys instance with your keys,
      ApiKeys(apiKey, readAccessToken),
      logConfig: const ConfigLogger(showErrorLogs: true, showLogs: true),
    );

    ///get the trending movies
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upComingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    ///setting state of movies(collection)
    setState(() {
      trendingMovies = trendingResult['results'];
      topRated = topRatedResult['results'];
      tvShows = tvShowsResult['results'];
      upComing = upComingResult['results'];
    });

    print(trendingMovies);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kTextColor,
        elevation: 1,
        child: const Icon(
          Icons.cast,
          color: kPrimaryRed,
        ),
        onPressed: () => print('Clicked!'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: CustomAppBar(
          scrollOffSet: _scrollOffSet,
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
              featuredContent: sintelContent,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0),
            sliver: SliverToBoxAdapter(
              child: Previews(
                key: const PageStorageKey('Previews'),
                title: 'Previews',
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              key: const PageStorageKey('myList'),
              title: 'My List',
              contentList: myList,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 5.0),
            sliver: SliverToBoxAdapter(
              child: TopRated(
                key: const PageStorageKey('TopRated'),
                topRated: topRated,
                name: 'Top Rated',
              ),
            ),
          ),

          ///big banner
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 5.0),
            sliver: SliverToBoxAdapter(
              child: ComingSoon(
                key: const PageStorageKey('ComingSoon'),
                upComing: upComing,
                name: 'Coming Soon',
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 5.0),
            sliver: SliverToBoxAdapter(
              child: TrendingMovies(
                key: const PageStorageKey('Trending'),
                trending: trendingMovies,
                name: 'Trending',
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 5.0),
            sliver: SliverToBoxAdapter(
              child: TVShows(
                key: const PageStorageKey('TVShows'),
                tvShows: tvShows,
                name: 'TV Shows',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
