struct S1 { inner: Int }
contract OptionalOuter {
    s: S1?;
    init() {
        self.s = S1{ inner: 7 };
    }
}