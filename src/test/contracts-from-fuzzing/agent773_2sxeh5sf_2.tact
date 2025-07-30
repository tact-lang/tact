struct Inner {
    a: Int;
    b: Bool = true;
    c: String = "hello";
    d: Address?; // optional without default
}

struct Outer {
    x: Int;
    y: Inner;
}

contract NestTest {
    nested: Outer = Outer{
        x: 1,
        y: Inner{a: 2, d: null}
    };

    init() {
        self.nested = Outer{
            x: 10,
            y: Inner{a: 20, d: null}
        };
    }

    receive() {
        // no-op
    }
}