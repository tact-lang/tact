struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract SingleNestedField {
    ns: NestedStruct;

    init() {
        self.ns = NestedStruct{ a: 1, b: true, c: "x" };
    }
}