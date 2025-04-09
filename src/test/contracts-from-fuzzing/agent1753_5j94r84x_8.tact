struct DefaultStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
    d: Slice?; // should default null
}

contract DefaultFieldsTest {
    s: DefaultStruct;
    init() {
        self.s = DefaultStruct{};
    }
}
