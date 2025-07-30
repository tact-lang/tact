struct InnerStruct {
    x: Int;
    y: Int?;
}

contract StructWithOptionalField {
    s: InnerStruct?;

    init() {
        self.s = null;
    }
}