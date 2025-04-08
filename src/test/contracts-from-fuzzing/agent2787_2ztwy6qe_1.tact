struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    c: Int;
    d: Inner;
    e: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            c: 1,
            d: Inner{a: 2, b: true},
            e: false
        };
    }
}
