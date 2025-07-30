struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Address? = null;
    d: Slice? = null;
}

contract DefaultsStruct {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}
