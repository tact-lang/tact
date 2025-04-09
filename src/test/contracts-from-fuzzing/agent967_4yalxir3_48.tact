struct OutOfOrderDefaults {
    a: Int;
    b: Int = 2;
    c: Int;
    d: Int = 4;
}

contract OutOfOrderDefaultsTest {
    s: OutOfOrderDefaults;

    init() {
        self.s = OutOfOrderDefaults{a:1, c:3};
    }
}