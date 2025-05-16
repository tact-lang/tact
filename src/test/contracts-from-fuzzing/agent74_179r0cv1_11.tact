struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: Int?; // null by default
}

contract TestContract {
    stuff: HasDefaults;
    init() {
        self.stuff = HasDefaults{ };
    }
}