// Mix of nested struct optionals and plain fields
struct NestedMixed {
    foo: Int;
    bar: Int?;
    baz: String;
}

contract MixedFlatNestedOpt {
    fld1: Int;
    fld2: NestedMixed?;
    fld3: String;
    fld4: Int?;

    init() {
        self.fld1 = 7;
        self.fld2 = null;
        self.fld3 = "hi";
        self.fld4 = null;
    }
}