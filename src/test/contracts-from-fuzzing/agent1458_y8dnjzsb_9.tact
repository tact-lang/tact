struct TestStruct {
    a: Int = 5;
    b: Bool = false;
    c: String = "hi";
    d: Int?;  
    e: Bool?;
}

contract Test {
    s: TestStruct;

    init() {
        self.s = TestStruct{
            d: null,
            e: null,
        };
    }
}