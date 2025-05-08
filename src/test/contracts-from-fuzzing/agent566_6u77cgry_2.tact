struct ComplexStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
}

contract Test {
    val: ComplexStruct;

    init() {
        self.val = ComplexStruct{
            a: 1,
            b: true,
            c: "abc",
            d: emptyCell(),
            e: myAddress(),
            f: emptyCell().asSlice()
        };
    }
}