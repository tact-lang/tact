struct BigDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "x";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract DefaultsTest {
    s: BigDefaults;

    init() {
        self.s = BigDefaults{};
    }
}