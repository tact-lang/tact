struct OptionalInner {
    optVal: Int?;
}

contract OptionalNestedTest {
    nested: OptionalInner;

    init() {
        self.nested = OptionalInner{optVal: null};
    }
}