struct InlineDefaults {
    x: Int = 1;
    y: Bool = true;
    z: String = "abc";
}

contract InlineDefaultsTest {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{ x: 10, y: false, z: "xyz" };
    }
}