struct DefaultsTestStruct {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int?; // implicitly default=null
    e: String?; // implicitly default=null
}

contract DefaultsTest {
    data: DefaultsTestStruct;

    init() {
        self.data = DefaultsTestStruct{};
    }
}
