struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "x";
}

contract DefaultsInStruct {
    data: HasDefaults;
    init() {
        self.data = HasDefaults{};
    }
    receive() {}
}