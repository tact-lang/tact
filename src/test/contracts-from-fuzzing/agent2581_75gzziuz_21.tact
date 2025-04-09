struct DefaultStruct {
    x: Int = 5;
    y: Bool = false;
    z: String = "abc";
}

contract DefaultsInStruct {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}
