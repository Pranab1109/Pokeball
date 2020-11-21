import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pokeball/pokemon.dart';

class PokeDetail extends StatefulWidget {
  final Pokemon pokemon;
  PokeDetail({this.pokemon});

  @override
  _PokeDetailState createState() => _PokeDetailState();
}

class _PokeDetailState extends State<PokeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.pokemon.name),
        elevation: 0.0,
      ),
      body: bodyWidget(context),
    );
  }

  bodyWidget(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width - 20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.15,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  widget.pokemon.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Text(
                  "Height : ${widget.pokemon.height}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                Text(
                  "Height : ${widget.pokemon.weight}",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                Text(
                  "TYPES",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.type
                      .map((e) => FilterChip(
                            label: Text(
                              e,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            onSelected: (b) {},
                            backgroundColor: Colors.deepOrange,
                          ))
                      .toList(),
                ),
                Text(
                  "WEAKNESS",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: widget.pokemon.weaknesses
                      .map((e) => FilterChip(
                            label: Text(
                              e,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            onSelected: (b) {},
                            backgroundColor: Colors.pink,
                          ))
                      .toList(),
                ),
                Text(
                  "NEXT EVOLUTION",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: (widget.pokemon.nextEvolution == null)
                      ? [
                          Container(
                            child: Text("No Further Evolution"),
                          )
                        ]
                      : widget.pokemon.nextEvolution
                          .map((e) => FilterChip(
                                label: Text(
                                  e.name,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                onSelected: (b) {},
                                backgroundColor: Colors.amber,
                              ))
                          .toList(),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: widget.pokemon.img,
            child: Container(
              height: 200.0,
              width: 200.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.pokemon.img),
                      fit: BoxFit.cover)),
            ),
          ),
        )
      ],
    );
  }
}
