struct OptionalStrings {
    first: String?;
    second: String?;
    third: String?;
}

contract OptionalStringsTest {
    val: OptionalStrings;
    init() {
        self.val = OptionalStrings{};
    }
}
