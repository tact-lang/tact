struct Inner {
    foo: Int;
    bar: Bool;
    name: String;
    data: Cell;
    slice: Slice;
    addr: Address;
}

contract WideFields {
    rec: Inner;

    init() {
        self.rec = Inner{
            foo: 10,
            bar: true,
            name: "test",
            data: emptyCell(),
            slice: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}
