struct S1 { a: Int; }

contract OptionalStructInst {
    s1: S1?;
    init() {
        self.s1 = null;
    }
}