struct DefaultStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract DefStructHolder {
    s: DefaultStruct;
    init() {
        self.s = DefaultStruct{};
    }
}