struct S {
    a: Int;
}

contract OptionalStruct {
    sopt: S?;

    init() {
        self.sopt = null;
    }
}