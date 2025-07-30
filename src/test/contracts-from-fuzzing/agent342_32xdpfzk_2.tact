struct Inner {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Slice;
}

contract Test2 {
    data: Inner;

    init() {
        self.data = Inner{
            a: 2,
            b: false,
            c: myAddress(),
            d: "hello",
            e: emptyCell().asSlice(),
        };
    }
}