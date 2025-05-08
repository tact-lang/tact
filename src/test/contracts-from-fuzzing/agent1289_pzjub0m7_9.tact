struct ComboDefaults {
    a: Int = 42;
    b: Int?;  // defaults to null implicitly
    c: Bool = true;
    d: String = "Tact";
}

contract DefaultValuesStructTest {
    stuff: ComboDefaults;

    init() {
        self.stuff = ComboDefaults{
            // omit a, c, d to use defaults
            b: null
        };
    }
}