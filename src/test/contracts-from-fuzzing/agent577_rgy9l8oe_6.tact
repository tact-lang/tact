struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    x: InnerMost;
    y: String;
}

struct Outer {
    p: Middle;
    q: Bool?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            p: Middle{
                x: InnerMost{ a: 42, b: false },
                y: "deep"
            },
            q: true
        };
    }
}