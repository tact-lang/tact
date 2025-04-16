struct ComplexDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;
    d: Int?;
    e: String?;
    f: Bool?;
}

contract ComplexDefaultsContract {
    val: ComplexDefaults;

    init() {
        self.val = ComplexDefaults{
            d: null,
            e: null,
            f: null
        };
    }
}
