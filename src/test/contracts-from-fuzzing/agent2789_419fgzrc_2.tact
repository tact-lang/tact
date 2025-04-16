struct InnerStruct {
    x: Int;
    y: Bool;
    z: String;
}

contract StructFieldsTest {
    inner: InnerStruct;

    init() {
        self.inner = InnerStruct{
            x: 10,
            y: true,
            z: "hello"
        };
    }
}
