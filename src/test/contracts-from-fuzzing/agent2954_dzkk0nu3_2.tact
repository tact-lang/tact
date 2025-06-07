struct InnerStruct {
    x: Int;
    y: Bool;
}

contract NestedStructTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ x: 123, y: false };
    }
}
