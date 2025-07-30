struct DefaultsTest {
    a: Int = 5;
    b: Bool = true;
    s: String = "x";
    o: Int?;
}

contract StructWithDefaults {
    val: DefaultsTest;

    init() {
        self.val = DefaultsTest{ };
    }
}