struct Inner {
    a: Bool;
    b: Int;
}

struct Outer {
    one: Int;
    two: Inner;
    three: Bool;
}

contract TestContract {
    state: Outer;

    init() {
        self.state = Outer{
            one: 1,
            two: Inner{ a: true, b: 2 },
            three: false,
        };
    }
}