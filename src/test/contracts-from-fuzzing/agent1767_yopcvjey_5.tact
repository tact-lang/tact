struct Outer {
    a: Int;
    b: Bool;
    c: String;
}

contract MixedPrimitives {
    s: Outer;

    init() {
        self.s = Outer{
            a: 42,
            b: false,
            c: "hello"
        };
    }
}
