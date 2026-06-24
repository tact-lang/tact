struct ComplexStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract ComplexContract {
    data: ComplexStruct;

    init() {
        self.data = ComplexStruct{
            a: 42,
            b: true,
            c: "hello",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}