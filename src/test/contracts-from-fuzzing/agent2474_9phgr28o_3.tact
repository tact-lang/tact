struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalNestedStructTest {
    opt: InnerStruct? = null;

    init() {
        self.opt = null;
    }
}
