struct DefaultsAndOptionals {
    a: Int? = null;
    b: Bool? = true;
    c: Address? = null;
    d: String? = "test";
}

contract ComplexDefaults {
    val: DefaultsAndOptionals;

    init() {
        self.val = DefaultsAndOptionals{}; // Relying on struct's defaults
    }
}