struct InlineDefaults {
    a: Int = 1;
    b: Bool?;
    c: String = "x";
}

contract InlineDefaultsTest {
    val: InlineDefaults;

    init() {
        self.val = InlineDefaults{ b: null };
    }
}