struct InnerStruct {
    x: Int as uint8;
    y: Bool;
    z: String;
}

contract StorageTest {
    inner: InnerStruct;
    init() {
        self.inner = InnerStruct{ x:42, y:true, z:"abc" };
    }
}