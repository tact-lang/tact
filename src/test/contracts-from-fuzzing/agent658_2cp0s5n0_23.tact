struct StructWithDefaults {
    i: Int = 10;
    b: Bool = true;
    s: String = "abc";
    o: Int? = null;
}

contract DefaultsTest {
    val: StructWithDefaults;

    init() {
        self.val = StructWithDefaults{};
    }
}