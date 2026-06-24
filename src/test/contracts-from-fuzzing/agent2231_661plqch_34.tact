struct AllWithDefaults {
    iv: Int = 42;
    bv: Bool = true;
    sv: String = "hello";
}

contract DefaultsStructContract {
    data: AllWithDefaults;

    init() {
        self.data = AllWithDefaults{};
    }
}