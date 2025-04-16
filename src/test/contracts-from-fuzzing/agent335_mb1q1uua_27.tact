struct OptionalsAndDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int = 5;
    e: Bool = true;
    f: String = "hi";
}

contract DefaultsAndOptionalsContract {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults {};
    }
}