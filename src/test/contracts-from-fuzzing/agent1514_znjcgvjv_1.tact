struct InnerStruct {
    i: Int;
    b: Bool;
}

contract NestedStructTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ i: 42, b: true };
    }
}