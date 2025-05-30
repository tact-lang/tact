struct DeepInner {
    a: Int;
    b: Bool?;
}

struct Mid {
    c: Int;
    d: DeepInner;
}

struct Outer {
    e: String?;
    f: Mid;
    g: Int;
}

contract DeepNested {
    myData: Outer;

    init() {
        self.myData = Outer{
            e: null,
            f: Mid{ c: 1, d: DeepInner{ a: 2, b: true } },
            g: 3
        };
    }
}
