struct InnerStruct {
    val1: Int;
    val2: Bool?;
}

contract StorageTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ val1: 10, val2: true };
    }
}