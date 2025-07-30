struct ComplexStruct {
    s1: String;
    flag: Bool;
    slice: Slice;
    nested: InnerStruct;
    maybeNum: Int?;
}

struct InnerStruct {
    num: Int;
    yesno: Bool;
}

contract ComplexHolder {
    stored: ComplexStruct;

    init() {
        self.stored = ComplexStruct{
            s1: "test",
            flag: false,
            slice: emptyCell().asSlice(),
            nested: InnerStruct{ num: 123, yesno: true },
            maybeNum: null
        };
    }
}