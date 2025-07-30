struct DeepNested {
    x: Int;
    y: Bool?;
}

struct Middle {
    d: DeepNested;
    e: String;
}

struct Outer {
    m: Middle;
    n: Int;
}

contract DeepContract {
    store: Outer;

    init() {
        self.store = Outer{
            m: Middle{
                d: DeepNested{ x: 7, y: null },
                e: "deep"
            },
            n: 42
        };
    }
}