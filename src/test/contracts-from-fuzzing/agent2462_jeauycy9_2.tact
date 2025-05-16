struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Outer {
    nested: Inner;
    value: Bool?;
}

contract TestContract {
    bundle: Outer;
    init() {
        self.bundle = Outer{
            nested: Inner{a: 10, b: null, c: false},
            value: null
        };
    }
}