struct Inner {
    a: Int;
    b: String?;
}

struct Middle {
    inner: Inner;
    c: Bool;
}

struct Outer {
    middle: Middle;
    d: Int;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: Middle{
                inner: Inner{
                    a: 1,
                    b: null
                },
                c: true
            },
            d: 42
        };
    }
}