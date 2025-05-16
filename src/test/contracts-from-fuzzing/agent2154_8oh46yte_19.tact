struct ZeroDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int?;
    e: String?;
}

contract ZeroDefaultsTest {
    z: ZeroDefaults;

    init() {
        self.z = ZeroDefaults{
            d: null,
            e: null
        };
    }
}