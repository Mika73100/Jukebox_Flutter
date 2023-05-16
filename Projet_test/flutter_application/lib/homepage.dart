import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player_page.dart';

  class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context)  {
    return Scaffold(
      //backgroundColor: Colors.blue, //j'utilise scaffold pour pouvoir scroller sur l'écran.
      extendBodyBehindAppBar: true, //ici je fais démarrer le budy toute en haut de ma page.
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
                // ignore: prefer_const_constructors
                HeaderSection(),
                PlayListSection(),
            ],
          ),
        ),
        bottomNavigationBar: const BottomSection(),
      );
    }
  }


////////////////////////////////////////////////////////////

class BottomSection extends StatelessWidget {
  const BottomSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items:const [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.pause,
          color: Colors.white,
        ),
        label: '',
      ),
      
      BottomNavigationBarItem(
        icon: Text(
          "Get Lucky",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
          )
        ),
        label: '',
      ),
      
      BottomNavigationBarItem(
        icon: Icon(Icons.arrow_circle_up,
        color: Colors.white,
        ),
        label: '',
      ),
    ]);
  }
}

///////////////////////////////////////////////////////////


class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        //title: const Text('Flutter Demo'),
        backgroundColor: Colors.white.withOpacity(0),
        elevation: 0,

        //ici je défini l'icon de gauche.
        leading: const IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
            ),
            onPressed: null,
        ),
        //ici je défini l'icon du bouton de droite
        // je les places dans un tableau car je peux en rajouter plusieurs.
        actions: const [
          IconButton(
            icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            ),
            onPressed: null,
          ),
        ],
      );
  }
}
  
  ////////////////////////////////////////////////////////////////////
  

  class HeaderSection extends StatelessWidget {
    const HeaderSection({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return Container(
        height: 500,
        decoration: const BoxDecoration(
          color: Colors.red,
          image: DecorationImage(
            image: AssetImage('images/daft-punk.jpg'),
            fit: BoxFit.cover, //ici je cover ma box grace a boxfit.
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
          ),
        ),
        child: Stack(
          children: [
          Positioned(
            left: 20,
            bottom: 30,
            child: Text(
              'Daft Punk', 
            style: GoogleFonts.arizonia(
            color: Colors.white,
            fontSize: 43,
            fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: MaterialButton(
            onPressed: () {
              Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => const PlayerPage(),
                ),
              );
            },
            color: Colors.blue,
            shape: const CircleBorder(),
            child: const Padding(
              padding: EdgeInsets.all(17),
              child: Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
              ),
            ),
          ))
        ]),
      );
    }
  }

  /////////////////////////////////////////////////////////////////////////////////

  class PlayListSection extends StatelessWidget {
    final List playList = [
      {
        'title' : 'Instant Crush',
        'duration' : '5:40',
        'played' : false,
      },
                  {
        'title' : 'Get Lucky',
        'duration' : '4:09',
        'played' : true,
      },
      {
        'title' : 'One More Time',
        'duration' : '5:22',
        'played' : false,
      },
      {
        'title' : 'Around the World',
        'duration' : '4:02',
        'played' : false,
      },
      {
        'title' : 'Header,Better,Faster,Stonger',
        'duration' : '3,43',
        'played' : false,
      },
    ];
    PlayListSection({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
      return Container(
        padding: const EdgeInsets.fromLTRB(30, 40, 20, 20),
        child: Column(
          children: [
            Row( //ici j'utilise Row pour pouvoir rajouter des container a l'horizontal et pas a la verticale.
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              const Text( 
                'Popular',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                    ),
                  ),
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    'Show All',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: playList.map((song) {
                  return SizedBox(
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          song['title'],
                          style: TextStyle(
                          color: song['played'] ? Colors.blue : Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                  song['duration'],
                                  style: TextStyle(
                                  color: song['played'] ? Colors.blue : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                Icons.more_vert,
                                color: song['played'] ? Colors.blue : Colors.grey,
                              ),
                            ],
                          )
                      ],
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        );
      }
    }