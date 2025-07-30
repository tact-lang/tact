struct Prim {
    a: Int;
    b: Bool;
    c: String;
}

struct Wrap {
    i: Prim;
    j: Prim;
}

struct TopMost {
    w: Wrap;
    k: Bool;
}

contract Funnel {
    x: TopMost;
    init() {
        self.x = TopMost{
            w: Wrap{
                i: Prim{ a: 1, b: true, c: "hi" },
                j: Prim{ a: 2, b: false, c: "bye" }
            },
            k: true
        };
    }
}