struct OptionalStrings {
    s1: String?;
    s2: String?;
}

contract OptStringsTest {
    data: OptionalStrings;
    init() {
        self.data = OptionalStrings{s1: null, s2: null};
    }
}