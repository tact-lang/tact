struct NestedOpt {
    opt1: Level1?;
}

struct Level1 {
    opt2: Level2?;
    v1: Int;
}

struct Level2 {
    v2: Int;
    opt3: Level3?;
}

struct Level3 {
    v3: Int;
}

contract Test {
    data: NestedOpt;

    init() {
        self.data = NestedOpt{
            opt1: null
        };
    }
}