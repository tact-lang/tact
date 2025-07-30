struct S { v: Int; }

contract OptionalStructPersistent {
    s: S?;
    init() {
        self.s = null;
    }
}