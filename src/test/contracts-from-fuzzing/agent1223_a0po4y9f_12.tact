struct StructWithStrings {
    a: String;
    b: String;
    c: Bool;
    d: Int;
}

contract StringsInStruct {
    s: StructWithStrings;
    init() {
        self.s = StructWithStrings{
            a: "foo",
            b: "bar",
            c: true,
            d: 42
        };
    }
}