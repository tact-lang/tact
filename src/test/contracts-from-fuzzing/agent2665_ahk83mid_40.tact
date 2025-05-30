struct PartialDefaults {
    a: Int;
    b: Int = 42;
    c: Bool;
    d: String = "x";
}

contract MixedDefaults {
    data: PartialDefaults;

    init() {
        self.data = PartialDefaults{
            a: 1,
            c: false
        };
    }
}