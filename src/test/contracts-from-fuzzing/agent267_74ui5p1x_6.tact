struct ManyDefaults {
    a: Int = 10;
    b: String = "hello";
    c: Bool = true;
}

contract DefaultsContract {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}