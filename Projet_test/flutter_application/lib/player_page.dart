import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: const [
            ImageAuthor(),
            PlayerControl(),
          ],
        ),
      ),
    );
  }
}


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
        leading: IconButton(
            icon:const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: 30,
            ),
            onPressed: () {
            Navigator.pop(context);
          },
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

class ImageAuthor extends StatelessWidget {
  const ImageAuthor({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/daft-punk.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: const [
        TitleSection(),
        ArtistPictureSection(),
      ]),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Artist',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          Text(
            'Daft-Punk',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w800,
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class ArtistPictureSection extends StatelessWidget {
  const ArtistPictureSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 65.0,
            child: Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            child: Container(
              height: 275,
              width: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('images/daft-punk.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.blue.withOpacity(1), BlendMode.darken),
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(50),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PlayerControl extends StatelessWidget {
  const PlayerControl({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          PlayingMusicTitle(),
          MusicSliderSection(),
          DurationSection(),
          MusicControlButtonSection()
        ],
      ),
    );
  }
}

class PlayingMusicTitle extends StatelessWidget {
  const PlayingMusicTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text(
            'Get Lucky',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 3),
          Text(
            'Daft-Punk',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class MusicSliderSection extends StatelessWidget {
  const MusicSliderSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Slider(
        value: 19,
        min: 1.0,
        max: 100,
        divisions: 10,
        activeColor: Colors.blue,
        inactiveColor: Colors.grey,
        onChanged: (double newValue) {},
      ),
    );
  }
}

class DurationSection extends StatelessWidget {
  const DurationSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 27, right: 27, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '1.08',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          Text(
            '3.14',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class MusicControlButtonSection extends StatelessWidget {
  const MusicControlButtonSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(
            icon: Icon(
              Icons.shuffle,
              color: Colors.grey,
              size: 35,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.skip_previous,
              color: Colors.black,
              size: 40,
            ),
            onPressed: null,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              side: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.pause,
                color: Colors.black,
                size: 40.0,
              ),
            ),
          ),
          const IconButton(
            icon: Icon(
              Icons.skip_next,
              color: Colors.black,
              size: 40,
            ),
            onPressed: null,
          ),
          const IconButton(
            icon: Icon(
              Icons.repeat,
              color: Colors.grey,
              size: 35,
            ),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
