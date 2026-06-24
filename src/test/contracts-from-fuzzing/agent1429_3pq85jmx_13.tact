struct HasDefaults {
    a: Int = 7;
    b: Bool = false;
    c: String = "x";
    d: Int?;
}

contract DefaultsTest {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{
            a: 10,
            b: true,
            c: "y",
            d: null
        };
    }
}