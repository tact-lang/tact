struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: Int?; // implicit default null
}

contract TestContract {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}