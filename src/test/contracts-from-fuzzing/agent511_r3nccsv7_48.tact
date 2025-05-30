struct ComplexField {
    foo: Int? = null;
    bar: Bool? = true;
    val: Int as int32 = 77;
    str: String = "ok";
}

contract WeirdStorage {
    f: ComplexField;

    init() {
        self.f = ComplexField{};
    }
}