struct S1 {
    a: Int;
}

contract OptionalPersistent {
    opt: S1?;
    init() {
        self.opt = null;
    }
}