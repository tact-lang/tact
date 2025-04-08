struct DefaultStruct {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract TestContract {
    data: DefaultStruct;
    init() {
        self.data = DefaultStruct{};
    }
}