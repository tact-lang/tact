struct S {
    a: Int;
}

contract FieldAsOptionalStruct {
    s: S?;

    init() {
        self.s = null;
    }
}
