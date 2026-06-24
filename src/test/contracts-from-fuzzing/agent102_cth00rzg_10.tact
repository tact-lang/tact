struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract AllFields {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            a: 42,
            b: false,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}