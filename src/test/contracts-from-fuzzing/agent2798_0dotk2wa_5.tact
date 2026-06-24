struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Inner;
    y: Inner;
    z: Inner;
}

contract MultiNested {
    content: Outer;

    init() {
        self.content = Outer{
            x: Inner{ a:1, b: true },
            y: Inner{ a:2, b: false },
            z: Inner{ a:3, b: true }
        };
    }
}