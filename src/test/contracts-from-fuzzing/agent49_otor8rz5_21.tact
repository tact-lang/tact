struct Inner {
    c: Cell;
    s: Slice;
}

struct Outer {
    inner: Inner;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                c: emptyCell(),
                s: emptyCell().asSlice(),
            },
            flag: true,
        };
    }
}
