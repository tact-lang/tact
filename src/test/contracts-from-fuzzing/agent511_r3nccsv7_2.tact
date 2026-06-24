struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Inner;
    y: Inner;
}

contract DeepNested {
    complex: Outer;

    init() {
        self.complex = Outer{
            x: Inner{ a: 10, b: true },
            y: Inner{ a: 20, b: null },
        };
    }
}