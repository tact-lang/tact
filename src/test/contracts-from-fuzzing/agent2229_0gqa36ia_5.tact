struct DefaultStruct {
    flag: Bool = true;
    num: Int = 42;
    txt: String = "default";
}

contract DefaultStructContract {
    s: DefaultStruct;
    init() {
        self.s = DefaultStruct{};
    }
}
