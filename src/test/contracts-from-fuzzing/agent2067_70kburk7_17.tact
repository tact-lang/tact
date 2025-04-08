struct ComplexDefaults {
    a: Int = 3;
    b: Bool = true;
    c: String = "Hello";
}

contract DefaultsInStruct {
    cd: ComplexDefaults;

    init() {
        self.cd = ComplexDefaults{};
    }
}