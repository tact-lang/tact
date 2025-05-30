struct ManyFieldsStruct {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Cell;
    s5: Slice;
    s6: Int;
    s7: Bool;
    s8: String;
    s9: Cell;
    s10: Slice;
}

contract StructFieldsTest {
    s: ManyFieldsStruct;

    init() {
        self.s = ManyFieldsStruct{
            s1: 1,
            s2: true,
            s3: "abc",
            s4: emptyCell(),
            s5: emptyCell().asSlice(),
            s6: 6,
            s7: false,
            s8: "def",
            s9: emptyCell(),
            s10: emptyCell().asSlice(),
        };
    }
}