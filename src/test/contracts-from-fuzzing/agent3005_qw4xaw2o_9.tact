struct Inner {
    a: Int;
    b: Bool;
}

struct Wrapper {
    x: Int;
    y: Bool;
    nested: Inner;
    optNested: Inner?;
    z: String;
}

contract MixedComplex {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            x: 1,
            y: false,
            nested: Inner{ a: 10, b: true },
            optNested: null,
            z: "Test"
        };
    }
}