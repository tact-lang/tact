struct Combo {
    foo: Int? = null;
    bar: Bool = true;
    baz: String? = null;
    qux: String = "hi";
}

contract MixedDefaults {
    data: Combo;

    init() {
        self.data = Combo{}; // Default values get used
    }
}