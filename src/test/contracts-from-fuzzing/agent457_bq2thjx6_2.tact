struct ManyTypesStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract Test {
    data: ManyTypesStruct;
    init() {
        self.data = ManyTypesStruct{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test",
        };
    }
}