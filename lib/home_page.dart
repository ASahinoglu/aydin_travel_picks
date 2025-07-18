import 'package:flutter/material.dart';
import 'country_card.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final List<String> _selectedCountries = [];

  void _addCountry(String countryName) {
    if (!_selectedCountries.contains(countryName)) {
      setState(() {
        _selectedCountries.add(countryName);
      });
    }
  }

  static final List<Map<String, String>> europeCountries = [
    {"emoji": "🇮🇹", "name": "Italien", "weather": "☀️ 25°C, sonnig"},
    {"emoji": "🇪🇸", "name": "Spanien", "weather": "☀️ 28°C, heiß"},
    {"emoji": "🇩🇪", "name": "Deutschland", "weather": "🌧️ 18°C, Regen"},
    {"emoji": "🇫🇷", "name": "Frankreich", "weather": "⛅ 22°C, bewölkt"},
    {"emoji": "🇳🇴", "name": "Norwegen", "weather": "❄️ 5°C, Schnee"},
  ];

  static final List<Map<String, String>> southAmericaCountries = [
    {"emoji": "🇧🇷", "name": "Brasilien", "weather": "🌴 30°C, tropisch"},
    {"emoji": "🇦🇷", "name": "Argentinien", "weather": "☁️ 20°C, mild"},
    {"emoji": "🇨🇱", "name": "Chile", "weather": "🌤️ 23°C, klar"},
    {"emoji": "🇵🇪", "name": "Peru", "weather": "🌧️ 17°C, Regen"},
    {"emoji": "🇨🇴", "name": "Kolumbien", "weather": "🌦️ 26°C, Schauer"},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 4,
            color: Colors.lightBlueAccent,
            child: const Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                "🌎 Willkommen zu deinen Reiseinspirationen",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text("Europa", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: europeCountries
                  .map(
                    (country) => CountryCard(
                      emoji: country["emoji"]!,
                      name: country["name"]!,
                      weather: country["weather"]!,
                      onTap: () => _addCountry(country["name"]!),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          const Text("Südamerika", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: southAmericaCountries
                  .map(
                    (country) => CountryCard(
                      emoji: country["emoji"]!,
                      name: country["name"]!,
                      weather: country["weather"]!,
                      onTap: () => _addCountry(country["name"]!),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
          const Text("Favoriten", style: TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            children: _selectedCountries
                .map((name) => Chip(label: Text(name)))
                .toList(),
          ),
        ],
      ),
    );
  }
}
