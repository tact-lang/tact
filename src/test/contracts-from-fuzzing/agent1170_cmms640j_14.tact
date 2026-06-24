struct S {
    a: Int;
    b: Bool;
}

contract OptionalStruct {
    opt: S?;

    init() {
        self.opt = null;
    }
}
