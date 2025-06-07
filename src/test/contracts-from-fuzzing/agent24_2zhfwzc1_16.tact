struct BigDefaults {
    a: Int = 10;
    b: String = "hello";
    c: Bool = false;
    d: String = "world";
    e: Int = 99;
    f: Bool = true;
    g: String = "!!!";
}

contract LotsOfDefaultsTest {
    data: BigDefaults;

    init() {
        self.data = BigDefaults{};
    }
}