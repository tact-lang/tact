struct IntDefaults {
    a: Int = 0;
    b: Int = 1;
    c: Int = -1;
    d: Int = 255;
    e: Int = -255;
}

contract DefaultsTest {
    val: IntDefaults;

    init() {
        self.val = IntDefaults{};
    }
}