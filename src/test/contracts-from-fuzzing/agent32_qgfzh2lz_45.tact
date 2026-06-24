struct S { x: Int }
contract TestDefaults {
    s: S;

    init() {
        self.s = S{ x: 7 };
    }
}
