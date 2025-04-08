struct NestedStruct {
    x: Int;
    y: Int;
}

contract DeepOptionalStructTest {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}