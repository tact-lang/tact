struct ExplicitDefaults {
    flag: Bool = true;
    count: Int = 42;
    note: String = "hello";
}

contract DefaultsContract {
    data: ExplicitDefaults;

    init() {
        self.data = ExplicitDefaults{};
    }
}