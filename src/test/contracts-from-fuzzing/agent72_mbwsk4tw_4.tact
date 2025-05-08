struct TestStruct {
    data1: Int?;
    data2: map<Int, Int>;
}

contract Test {
    testField: map<Int, TestStruct>;

    init() {
        self.testField = emptyMap();
    }
}