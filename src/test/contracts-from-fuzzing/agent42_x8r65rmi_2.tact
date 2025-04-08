struct Inner {
    a: Int;
    b: Int?;
    c: Bool;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{ a: 5, b: null, c: true },
            flag: false
        };
    }
}