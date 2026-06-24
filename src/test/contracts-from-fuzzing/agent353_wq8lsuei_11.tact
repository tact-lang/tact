struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int?;
    y: Slice;
    inner: Inner;
}

contract TestContract {
    data: Outer?;

    init() {
        self.data = Outer{
            x: null,
            y: emptyCell().asSlice(),
            inner: Inner{
                a: 0,
                b: false,
            },
        };
    }
}