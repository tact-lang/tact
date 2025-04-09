struct DefaultsStruct {
    a: Int = 1;
    b: String = "def";
    c: Bool = true;
}

contract DefaultsSimple {
    st: DefaultsStruct;

    init() {
        self.st = DefaultsStruct{};
    }
}
