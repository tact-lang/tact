struct DefaultsStruct {
    a: Int = 5;
    b: Bool = false;
    c: Int? = null;
    d: Bool = true;
}

contract TestContract {
    s: DefaultsStruct;

    init() {
        self.s = DefaultsStruct{};
    }
}