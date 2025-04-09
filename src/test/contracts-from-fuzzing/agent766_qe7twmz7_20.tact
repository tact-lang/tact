struct Level5 { x5: Int = 5; }
struct Level4 { x4: Level5 = Level5{}; }
struct Level3 { x3: Level4 = Level4{}; }
struct Level2 { x2: Level3 = Level3{}; }
struct Level1 { x1: Level2 = Level2{}; }

contract FiveDeep {
    root: Level1 = Level1{};
}