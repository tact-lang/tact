struct LargeStruct {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract StructAsField {
    data: LargeStruct;
    init() {
        self.data = LargeStruct{
            a: 1,
            b: false,
            c: myAddress(),
            d: "abc",
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}