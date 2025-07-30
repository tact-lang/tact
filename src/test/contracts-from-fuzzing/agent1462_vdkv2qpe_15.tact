struct SInner { val: Int; }

contract OptionalStructFields {
    s1: SInner?;
    s2: SInner?;

    init() {
        self.s1 = null;
        self.s2 = SInner{ val: 42 };
    }
}