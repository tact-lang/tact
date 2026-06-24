struct OptionalInner {
    a: Int?;
    b: Bool;
}

contract NestedOptionalStructPersistTest {
    s: OptionalInner;

    init() {
        self.s = OptionalInner{ a: null, b: false };
    }
}