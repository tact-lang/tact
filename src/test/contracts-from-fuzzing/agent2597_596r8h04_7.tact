struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "x";
    d: Int?;
}

contract DefaultsTest {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{
            d: null,
        };
    }
}