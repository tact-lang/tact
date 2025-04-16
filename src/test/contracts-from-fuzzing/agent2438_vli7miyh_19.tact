struct DefaultDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "ok";
}

contract DefaultsInStruct {
    st: DefaultDefaults;

    init() {
        self.st = DefaultDefaults{};
    }
}
