// mix of optional, defaulted, plain fields
struct ComplexDefaults {
    a: Int = 1;
    b: Int?;
    c: String? = null;
    d: Bool = false;
    e: Bool? = true;
}

contract ComplexDefaultsStorage {
    data: ComplexDefaults;

    init() {
        self.data = ComplexDefaults{};
    }
}