struct Inner {
    d: Int;
    e: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Bool?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            a: 10,
            b: Inner{
                d: 7,
                e: false,
            },
            c: null,
        };
    }
}