struct OverloadedDefaults {
    a: Int = 10;
    b: Int = 20;
    c: Int = 30;
    d: Bool = true;
    e: String = "abc";
    f: Address? = null;
    g: Slice? = null;
    h: Cell? = null;
}

contract ManyDefaultsTest {
    data: OverloadedDefaults;
    init() {
        self.data = OverloadedDefaults{};
    }
}