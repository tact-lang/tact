struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Int?;
    g: Bool?;
    h: String;
    i: Address;
    j: Cell;
}

contract BigData {
    bigField: LargeStruct;
    init() {
        self.bigField = LargeStruct{
            a: 1, b: true, c: "A", d: emptyCell(), e: emptyCell().asSlice(),
            f: null, g: false, h: "H", i: myAddress(), j: emptyCell()
        };
    }
}