struct LargeStruct {
    a: Int;
    b: Bool;
    c: Slice;
    d: Cell;
    e: String;
    f: Int?;
    g: Bool?;
    h: Address;
    i: String?;
    j: Cell?;
}

contract LargeFieldsTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            a: 10,
            b: true,
            c: emptyCell().asSlice(),
            d: emptyCell(),
            e: "test",
            f: null,
            g: null,
            h: myAddress(),
            i: null,
            j: null,
        };
    }
}