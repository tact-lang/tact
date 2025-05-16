struct Inner {
    c: Int;
    d: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
}

contract TestContract {
    values: Outer?;

    init() {
        self.values = Outer{
            a: 123,
            b: Inner{
                c: 456,
                d: true
            }
        };
    }
}
