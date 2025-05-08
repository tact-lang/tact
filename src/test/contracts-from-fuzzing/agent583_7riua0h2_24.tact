struct Middle {
    a: Int;
    b: String;
}

struct Outer {
    mid: Middle;
    c: Bool;
}

contract MultiLayerNested {
    outer: Outer;

    init() {
        self.outer = Outer{
            mid: Middle{ a: 7, b: "hi" },
            c: true,
        };
    }
}