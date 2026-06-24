struct NestedDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int?; // defaults to null
}

contract DefaultsTest {
    dat: NestedDefaults;
    init() {
        self.dat = NestedDefaults{};
    }
}