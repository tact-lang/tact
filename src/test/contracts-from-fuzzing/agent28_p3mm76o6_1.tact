struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructFieldTest {
    val: InnerStruct?;

    init() {
        self.val = null;
    }
}