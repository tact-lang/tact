struct Outer {
    f1: Int;
    f2: Bool;
    nested: Inner;
}

struct Inner {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer{
            f1: 1,
            f2: false,
            nested: Inner{ a: null, b: null, c: null }
        };
    }
}