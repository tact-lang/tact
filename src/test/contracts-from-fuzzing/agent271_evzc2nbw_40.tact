struct VariousDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "";
    d: Address;
}

contract VariousDefaultsTest {
    s: VariousDefaults;

    init() {
        self.s = VariousDefaults{ d: myAddress() };
    }
}
