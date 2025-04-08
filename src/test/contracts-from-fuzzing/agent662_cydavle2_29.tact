struct MultipleDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int as uint32 = 100;
    e: Bool = false;
}

contract MultipleDefaultsContract {
    f: MultipleDefaults;
    init() {
        self.f = MultipleDefaults{};
    }
}