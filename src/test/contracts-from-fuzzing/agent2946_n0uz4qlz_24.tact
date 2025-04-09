struct OptionalsAndDefaults {
    a: Int = 10;
    b: Bool = false;
    c: Int?;
    d: Bool?;
}

contract PersistTest {
    val: OptionalsAndDefaults;

    init() {
        self.val = OptionalsAndDefaults{
            a: 1, b: true, c: null, d: null
        };
    }
}