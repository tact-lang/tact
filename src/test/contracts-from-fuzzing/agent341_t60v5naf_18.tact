struct Level1 {
    i: Int;
    b: Bool;
    s: String;
}

struct Level2 {
    opt1: Level1?;
    opt2: Level1?;
}

contract NestedOptionals2 {
    l2: Level2;

    init() {
        self.l2 = Level2{ opt1: null, opt2: null };
    }
}