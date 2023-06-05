import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:litedex/model/pokemon.dart';


class PokemonInfo extends StatelessWidget {
  final Pokemon? pokemon;

  const PokemonInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    Color backgroundColor = Colors.red;

    if (pokemon != null){
      if(pokemon!.type == 'normal'){
        backgroundColor = const Color.fromARGB(255, 189, 96, 62);
      } else if(pokemon!.type == 'fire'){
        backgroundColor = Colors.red;
      } else if(pokemon!.type == 'water'){
        backgroundColor = Color.fromARGB(255, 90, 170, 235);
      } else if(pokemon!.type == 'grass'){
        backgroundColor = const Color.fromARGB(255, 93, 207, 97);
      } else if(pokemon!.type == 'flying'){
        backgroundColor = const Color.fromARGB(255, 102, 169, 224);
      } else if(pokemon!.type == 'fighting'){
        backgroundColor = const Color.fromARGB(255, 114, 59, 38);
      } else if(pokemon!.type == 'poison'){
        backgroundColor = Color.fromARGB(255, 168, 42, 197);
      } else if(pokemon!.type == 'electric'){
        backgroundColor = Colors.yellow;
      } else if(pokemon!.type == 'ground'){
        backgroundColor = Colors.brown;
      } else if(pokemon!.type == 'rock'){
        backgroundColor = Colors.grey;
      } else if(pokemon!.type == 'psychic'){
        backgroundColor = Color.fromARGB(255, 29, 175, 90);
      } else if(pokemon!.type == 'ice'){
        backgroundColor = Color.fromARGB(255, 135, 214, 229);
      } else if(pokemon!.type == 'bug'){
        backgroundColor = Color.fromARGB(255, 236, 59, 59);
      } else if(pokemon!.type == 'ghost'){
        backgroundColor = const Color.fromARGB(255, 80, 78, 78);
      } else if(pokemon!.type == 'steel'){
        backgroundColor = Colors.grey;
      } else if(pokemon!.type == 'dragon'){
        backgroundColor = Colors.orange;
      } else if(pokemon!.type == 'dark'){
        backgroundColor = Colors.black;
      } else if(pokemon!.type == 'fairy'){
        backgroundColor = Color.fromARGB(255, 232, 64, 148);
      } 
    }
    
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: getTitle(),
      ),
      body: showInformation(context), 
    );
    
  }

  Text getTitle() {
    if (pokemon != null) {
      return Text(pokemon!.name.toUpperCase());
    } else {
      return const Text("Pokémon não encontrado...");
    }
  }

  Flex showInformation(BuildContext context) {
    if (pokemon != null) {
      return pokemonInfoScreen(context);
    } else {
      return noInfoScreen();
    }
  }

  Row pokemonInfoScreen(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                child: SvgPicture.network(
                  '${pokemon?.image}',
                  fit: BoxFit.scaleDown,
                ),
                width: MediaQuery.of(context).size.width - 100,
                
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  side: BorderSide(
                    color: Colors.black,
                    width: 4.0,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "#${pokemon?.id}",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "#${pokemon?.name}",
                      style: const TextStyle(
                        fontSize: 64.0,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "hp",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(
                      value: pokemon?.hp != null
                          ? pokemon!.hp! / 252 // Coloque aqui o valor máximo do HP
                          : 0,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                    ),
                    Text(
                      "ataque",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(
                      value: pokemon?.attack != null
                          ? pokemon!.attack! / 252 // Coloque aqui o valor máximo do HP
                          : 0,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                    ),
                    Text(
                      "defesa",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                      child: LinearProgressIndicator(
                      value: pokemon?.defense != null
                          ? pokemon!.defense! / 252 // Coloque aqui o valor máximo do HP
                          : 0,
                      backgroundColor: Colors.grey,
                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    ),
                    Text(
                      " ",
                      style: const TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Row noInfoScreen() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              "Pokémon não encontrado...",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
