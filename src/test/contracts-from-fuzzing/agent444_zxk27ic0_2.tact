struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract TestMixedFields {
    myStruct: S;

    init() {
        self.myStruct = S{
            a: 1,
            b: false,
            c: "hi",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}