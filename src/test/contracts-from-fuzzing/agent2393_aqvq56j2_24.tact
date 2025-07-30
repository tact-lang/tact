struct Level3 { v: Int; }
struct Level2 { l3: Level3; }
struct Level1 { l2: Level2; }

contract DeepEmbed {
    val: Level1 = Level1 { l2: Level2 { l3: Level3 { v: 42 } } };
}