struct DefaultsOpt {
    a: Int?;            // implicit null default
    b: Bool? = null;   // explicit null default
    c: String? = null; // explicit null default
}

contract TestDefaultsOpt {
    st: DefaultsOpt;

    init() {
        self.st = DefaultsOpt{};
    }
}
