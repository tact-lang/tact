struct SimpleStruct {
    a: Int;
    b: Bool;
    c: String;
}

contract StorageTest {
    data: SimpleStruct;
    
    init() {
        self.data = SimpleStruct{a: 1, b: true, c: "test"};
    }
}