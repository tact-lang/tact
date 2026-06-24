struct ManyDefaults {
    a: Int = 1;
    b: String = "b";
    c: Bool = true;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;
}

contract DefaultsTest {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}