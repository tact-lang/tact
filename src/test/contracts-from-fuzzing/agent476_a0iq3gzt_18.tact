struct DefaultStruct {
    x: Int = 42;
    y: Bool = true;
    z: String = "abc";
}

contract DefTest {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}
