struct Level3 { x: Int = 3; }
struct Level2 { l3: Level3?; }
struct Level1 { l2: Level2?; }

contract Test14 {
    deep: Level1 = Level1{ l2: null };
}