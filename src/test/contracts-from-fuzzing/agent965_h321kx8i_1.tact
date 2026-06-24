struct TestStruct {
    x: Int;
    y: Bool?;
    z: String;
}

contract Test {
    data: TestStruct;
    
    init() {
        self.data = TestStruct{
            x: 7,
            y: null,
            z: "abc",
        };
    }
}