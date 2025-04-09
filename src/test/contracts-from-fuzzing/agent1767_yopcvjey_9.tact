struct DefaultsStruct {
    a: Int = 7;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultFields {
    s: DefaultsStruct;

    init() {
        self.s = DefaultsStruct{};
    }
}
