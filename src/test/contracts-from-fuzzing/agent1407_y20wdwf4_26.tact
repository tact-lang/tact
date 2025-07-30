struct Level4 {
    endVal: Int;
}

struct Level3 {
    l4: Level4?;
}

struct Level2 {
    l3: Level3?;
}

struct Level1 {
    l2: Level2?;
}

contract TestContract {
    deepOpt: Level1?;

    init() {
        self.deepOpt = null;
    }
}