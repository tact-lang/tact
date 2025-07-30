struct S {
    a: Int;
    b: Bool;
}

contract OptStruct {
    s: S?;

    init() {
        self.s = null;
    }
}