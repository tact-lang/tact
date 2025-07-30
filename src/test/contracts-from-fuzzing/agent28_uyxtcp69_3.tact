struct Inner {
    x: Int;
    y: Bool?;
}

struct Outer {
    sub: Inner;
    txt: String?;
}

contract DeepNest {
    s: Outer;

    init() {
        self.s = Outer{
            sub: Inner{ x: 5, y: true },
            txt: "hello",
        };
    }
}