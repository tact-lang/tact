struct DefaultStruct {
    n: Int = 5;
    b: Bool = false;
    s: String = "abc";
}

contract Defaults {
    data: DefaultStruct;
    init() {
        self.data = DefaultStruct{};
    }
}