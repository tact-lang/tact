struct LongStrings {
    short: String = "hi";
    longone: String = "this is a rather long string just to test serialization and stuff";
}

contract LongStringsTest {
    data: LongStrings;
    init() {
        self.data = LongStrings{};
    }
}