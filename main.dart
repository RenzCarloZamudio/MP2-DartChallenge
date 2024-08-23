import 'dart:math'; // Imports the math library to generate random numbers

// Defines the song class
class Song {
  String title; // Title of the song
  String stageType; // Stage type of the song
  String duration; // Duration of the song in minutes and seconds
  String author; // Author of the song

  // Initializes the song's properties
  Song(this.title, this.stageType, this.author, this.duration);

  // Prints the description of the song
  void songDesc() {
    print('$stageType Stage: $title by $author ($duration)');
  }
}

// Defines the playlist class
class Playlist {
  List<Song> songs; // Lists songs in the playlist

  //Initializes the playlist with a list of songs
  Playlist(this.songs);

  // print a random song from each stage type
  void random() {
    // Creates a map to group songs by stageType
    Map<String, List<Song>> songsByStageType = {};
    
    // Iterates through each song and group them by stageType
    for (var song in songs) {
      if (!songsByStageType.containsKey(song.stageType)) {
        // Initializes with an empty list, if stageType not yet in map
        songsByStageType[song.stageType] = [];
      }
      // Adds song to the corresponding stageType list
      songsByStageType[song.stageType]!.add(song);
    }

    // Creates a random object to select random items
    Random random = Random();
    print('Random Songs:');
    
    // Iterates through each stageType and pick a random song
    for (var stageType in songsByStageType.keys) {
      var stageSongs = songsByStageType[stageType]!;
      if (stageSongs.isNotEmpty) {
        // Selects a random song from the list of stageSongs
        Song selectedSong = stageSongs[random.nextInt(stageSongs.length)];
        // Prints the details of the selected song
        print('${selectedSong.stageType} Stage: ${selectedSong.title} by ${selectedSong.author} (${selectedSong.duration})');
      }
    }
    print(''); // Prints a newline for better readability
  }

  // Sort and print songs by a randomly selected author
  void playSort() {
    // Creates a random object to select random items
    Random random = Random();
    
    // Extracts unique authors from the songs list
    Set<String> authors = songs.map((song) => song.author).toSet();
    if (authors.isEmpty) return; // Exit if there are no authors
    
    // Picks a random author from the set of authors
    String randomAuthor = authors.elementAt(random.nextInt(authors.length));

    // Filters songs by the randomly picked author
    List<Song> filteredSongs = songs.where((song) => song.author == randomAuthor).toList();

    // Sorts the filtered songs by title
    filteredSongs.sort((a, b) => a.title.compareTo(b.title));

    // Extracts unique stage types from the songs list
    Set<String> stageTypes = songs.map((song) => song.stageType).toSet();
    if (stageTypes.isEmpty) return; // Exit if there are no stage types

    // Picks a random stage type from the set of stage types
    String randomStageType = stageTypes.elementAt(random.nextInt(stageTypes.length));

    print('Playlist sorted by artist:');
    print('Playlist: $randomStageType Stage');
    
    // Prints the details of each song in the filtered and sorted list
    for (var song in filteredSongs) {
      print('${song.stageType} Stage: ${song.title} by ${song.author} (${song.duration})');
    }
    print(''); // Prints a newline for better readability
  }
}

// Defines a class to represent a music festival
class MusicFestival {
  String totalDuration; // The total duration of the festival in seconds

  // Initializes the festival with total duration
  MusicFestival(this.totalDuration);

  // Prints the total festival duration
  void festDuration() {
    print('Total Festival Duration: $totalDuration seconds\n');
  }
}

// Extracts a list of authors from a list of songs
List<String> extractAuthors(List<Song> songs) {
  List<String> authors = [];
  for (var song in songs) {
    authors.add(song.author); // Add each song's author to the list
  }
  return authors; // Returns the list of authors
}

// Main method
void main() {
  // Creates Song objects with title, stageType, author, and duration
  Song song1 = Song('Flowers', 'Main', 'Miley Cyrus', '3:20');
  Song song2 = Song('Anti-Hero', 'Main', 'Taylor Swift', '3:21');
  Song song3 = Song('Calm Down', 'Main', 'G-easy & Bebe Rexha', '2:52');
  Song song4 = Song('Snooze', 'Main', 'SZA', '3:27');
  Song song5 = Song('Ruin My Life', 'Main', 'Zara Larsson', '3:10');

  Song song6 = Song('Eternal Return', 'Indie', 'Mitski', '3:15');
  Song song7 = Song('Crush', 'Indie', 'Florence + The Machine', '4:03');
  Song song8 = Song('Starlight', 'Indie', 'Phoebe Bridgers', '3:46');
  Song song9 = Song('Green Eyes', 'Indie', 'Bon Iver', '4:10');
  Song song10 = Song('Green Eyes', 'Indie', 'Mitski', '4:10');

  Song song11 = Song('Blinding Lights', 'Electronic', 'The Weeknd', '3:22');
  Song song12 = Song('Lose Control', 'Electronic', 'Meduza, Becky Hill, Goodboys', '2:55');
  Song song13 = Song('Fever', 'Electronic', 'Bicep', '4:08');
  Song song14 = Song('Breathe', 'Electronic', 'Calvin Harris', '3:46');
  Song song15 = Song('Underwater', 'Electronic', 'John Summit', '3:34');

  // Creates a list of all songs
  List<Song> allSongs = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10, song11, song12, song13, song14, song15];
  
  // Creates a Playlist object with the list of all songs
  Playlist playlist = Playlist(allSongs);

  // Creates a MusicFestival object with a total duration
  MusicFestival musicFestival = MusicFestival('5031');
  musicFestival.festDuration(); // Prints the festival duration
  
  playlist.random(); // Prints a random song from each stage type
  playlist.playSort(); // Prints songs by a randomly selected author, sorted by title
}
