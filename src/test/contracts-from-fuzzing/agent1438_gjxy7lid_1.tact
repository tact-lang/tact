struct InnerStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract TestDeeplyNestedOptional {
    s: InnerStruct? = null;

    init() {
        self.s = null;
    }
}