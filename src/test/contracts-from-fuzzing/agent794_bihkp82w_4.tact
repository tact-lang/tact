struct Level3 { z: Int = 33; }
struct Level2 { lev3: Level3; }
struct Level1 { lev2: Level2; }

contract NestedDeep {
    root: Level1 = Level1{ lev2: Level2{ lev3: Level3{ z: 99 } } };
    init() {}
}