struct Level5 { num: Int = 5; }
struct Level4 { child: Level5 = Level5{}; }
struct Level3 { child: Level4 = Level4{}; }
struct Level2 { child: Level3 = Level3{}; }
struct Level1 { child: Level2 = Level2{}; }

contract ChainNested {
    top: Level1 = Level1{};
}