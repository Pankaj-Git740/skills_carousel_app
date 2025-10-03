class Skill {
  final String name;
  final String level;
  final String image;

  Skill({required this.name, required this.level, required this.image});

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      name: json['name'] as String,
      level: json['level'] as String,
      image: json['image'] as String,
    );
  }
}
