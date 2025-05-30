struct FieldsWithDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hello";
}

contract TestContract {
    d: FieldsWithDefaults;

    init() {
        self.d = FieldsWithDefaults{};
    }
}