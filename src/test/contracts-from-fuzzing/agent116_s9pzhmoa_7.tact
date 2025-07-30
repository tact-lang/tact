struct DefaultStruct {
    a: Int = 42;
    b: Bool = false;
    c: String = "default";
}

contract DefaultValues {
    s: DefaultStruct;

    init() {
        self.s = DefaultStruct{};
    }
}