struct ManyNestedStructs {
    s1: Int;
    s2: Bool;
    s3: String;
    s4: Address;
    s5: Cell;
    s6: Slice;
    s7: Int?;
    s8: Bool?;
    s9: String?;
}

contract BigStructField {
    data: ManyNestedStructs;

    init() {
        self.data = ManyNestedStructs{
            s1: 1,
            s2: true,
            s3: "x",
            s4: myAddress(),
            s5: emptyCell(),
            s6: emptyCell().asSlice(),
            s7: null,
            s8: null,
            s9: null,
        };
    }
}
