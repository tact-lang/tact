struct Levels3 {
    a: Int;
    b: Bool;
    c: String;
}

struct TopLevel {
    l1: Levels3;
    l2: Levels3;
}

contract Layers {
    store: TopLevel;
    init() {
        self.store = TopLevel{
            l1: Levels3{ a: 1, b: true, c: "x" },
            l2: Levels3{ a: 2, b: false, c: "y" },
        };
    }
}