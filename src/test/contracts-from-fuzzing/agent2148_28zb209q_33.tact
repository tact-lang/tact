struct DefaultStruct {
    a: Int = 5;
    b: Bool = false;
    c: String = "hello";
}

contract DefTest {
    d: DefaultStruct;

    init() {
        self.d = DefaultStruct{};
    }
}