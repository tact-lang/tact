struct InnerStruct {
    a: Int;
    b: Bool;
}

contract StructFieldTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{
            a: 123,
            b: false,
        };
    }
}