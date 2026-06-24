struct LargeStruct {
    a: Int;
    b: Bool;
    c: String?;
    d: Cell;
    e: Bool?;
    f: String;
    g: Builder;
    h: Int?;
    i: Address;
    j: Slice;
}

contract BigStructField {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 1, b: false, c: null, d: emptyCell(), e: null,
            f: "hi", g: beginCell(), h: null, i: myAddress(), j: emptyCell().asSlice(),
        };
    }
}