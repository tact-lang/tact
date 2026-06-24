struct Inner {
    a: Int;
}

struct Outer {
    nested: Inner;
    flag: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            nested: Inner{ a: 123 },
            flag: false
        };
    }
}