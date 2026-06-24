struct DeepNested {
    x: Int;
    y: Bool;
}

struct Middle {
    a: DeepNested;
    b: Bool;
}

struct Top {
    t: Middle;
    f: Int;
}

contract NestedContract {
    top: Top;

    init() {
        self.top = Top{
            t: Middle{
                a: DeepNested{ x: 5, y: true },
                b: false
            },
            f: 10
        };
    }
}