struct Level1 {
    val: Int;
}

struct Level2 {
    lvl1: Level1;
}

struct Level3 {
    lvl2: Level2;
}

contract DeeplyNested {
    deep: Level3;
    init() {
        self.deep = Level3{ lvl2: Level2{ lvl1: Level1{ val: 99 } } };
    }
}