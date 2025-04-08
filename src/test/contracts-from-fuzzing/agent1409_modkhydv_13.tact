struct Flat {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

struct Wrapper {
    inner: Flat;
    flag: Bool;
    number: Int;
}

contract Test {
    w: Wrapper;
    init() {
        self.w = Wrapper{
            inner: Flat{
                a: 1, b: true, c: myAddress(), d: emptyCell(), e: emptyCell().asSlice(), f: "abc"
            },
            flag: false,
            number: 42
        };
    }
    receive() { let _ = self.w.inner.f; }
}