struct InlineDefaults {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
    d: Address?;
}

contract DefaultsTest {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{
            // omit a, b, c
            d: null
        };
    }
}