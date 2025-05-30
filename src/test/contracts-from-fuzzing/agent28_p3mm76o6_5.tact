struct OptionalDeep {
    n: Int?;
    s: String?;
}

contract OptionalDeepStructTest {
    nested: OptionalDeep?;

    init() {
        self.nested = null;
    }
}