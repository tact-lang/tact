struct SInner { a: Int; b: Bool; }
contract OptionalStructDefault {
    s: SInner? = null;
    init() {
        self.s = null;
    }
}