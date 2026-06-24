struct Level4 {
    innerVal: Int?;
}

struct Level3 {
    l4opt: Level4?;
}

struct Level2 {
    l3: Level3;
    val: Int;
}

struct Level1 {
    optLevel2: Level2?;
}

contract DeepWide {
    deepOpt: Level1?;

    init() {
        self.deepOpt = null;
    }
}