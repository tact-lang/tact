struct SManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "constant";
    d: Int?;  // defaults to null implicitly
    e: Bool?; // defaults to null implicitly
}

contract DefaultsTest {
    val: SManyDefaults;

    init() {
        self.val = SManyDefaults{};
    }
}