struct Inner {
    a: Int;
    b: Bool;
    c: Address;
}

struct Outer {
    inner: Inner;
    d: String;
    e: Slice;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                a: 7,
                b: false,
                c: myAddress(),
            },
            d: "hello",
            e: emptyCell().asSlice(),
        };
    }
}