import 'package:flutter/material.dart';
import 'package:skills_carousel_app/models/skill.dart';
import 'package:skills_carousel_app/widgets/skill_card.dart';

class SkillCarouselScreen extends StatelessWidget {
  const SkillCarouselScreen({super.key});

  List<Skill> get skills => [
    Skill(
      name: "Dribbling",
      level: "Basic",
      image:
          "https://images.unsplash.com/photo-1546519638-68e109498ffc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=400&q=80",
    ),
    Skill(
      name: "Passing",
      level: "Basic",
      image:
          "https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dGVjaHxlbnwwfHwwfHx8MA%3D%3D",
    ),
    Skill(
      name: "Shooting",
      level: "Basic",
      image:
          "https://plus.unsplash.com/premium_photo-1683121716061-3faddf4dc504?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dGVjaHxlbnwwfHwwfHx8MA%3D%3D",
    ),
    Skill(
      name: "Vault",
      level: "Intermediate",
      image:
          "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRlY2h8ZW58MHx8MHx8fDA%3D",
    ),
    Skill(
      name: "Tumbling",
      level: "Intermediate",
      image:
          "https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHRlY2h8ZW58MHx8MHx8fDA%3D",
    ),
    Skill(
      name: "Balance Beam",
      level: "Intermediate",
      image:
          "https://images.unsplash.com/photo-1579567761406-4684ee0c75b6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHRlY2h8ZW58MHx8MHx8fDA%3D",
    ),
    Skill(
      name: "Agility",
      level: "Advanced",
      image:
          "https://plus.unsplash.com/premium_photo-1678566111481-8e275550b700?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHRlY2h8ZW58MHx8MHx8fDA%3D",
    ),
    Skill(
      name: "Endurance",
      level: "Advanced",
      image:
          "https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjJ8fHRlY2h8ZW58MHx8MHx8fDA%3D",
    ),
    Skill(
      name: "Precision",
      level: "Advanced",
      image:
          "https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHRlY2h8ZW58MHx8MHx8fDA%3D",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Group skills by level
    final groupedSkills = <String, List<Skill>>{
      'Basic': [],
      'Intermediate': [],
      'Advanced': [],
    };

    for (final skill in skills) {
      if (groupedSkills.containsKey(skill.level)) {
        groupedSkills[skill.level]!.add(skill);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Skills'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildLevelSection(context, 'Basic', groupedSkills['Basic']!),
          const SizedBox(height: 24),
          _buildLevelSection(
            context,
            'Intermediate',
            groupedSkills['Intermediate']!,
          ),
          const SizedBox(height: 24),
          _buildLevelSection(context, 'Advanced', groupedSkills['Advanced']!),
        ],
      ),
    );
  }

  Widget _buildLevelSection(
    BuildContext context,
    String level,
    List<Skill> skills,
  ) {
    if (skills.isEmpty) return const SizedBox.shrink();

    double cardWidth;
    final screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth >= 900) {
      // Desktop / large tablet: show 3 cards + peek
      cardWidth = (screenWidth - 64) / 3; // 64 = total horizontal padding
    } else if (screenWidth >= 600) {
      // Tablet: show 2 cards + peek
      cardWidth = (screenWidth - 48) / 2.2;
    } else {
      // Mobile: show 1 card + peek
      cardWidth = screenWidth * 0.8;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
          child: Text(
            level,
            style: TextStyle(
              fontSize: screenWidth >= 600 ? 22 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(
          height: screenWidth >= 600 ? 180 : 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: skills.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(right: 16.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: SkillCard(skill: skills[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
