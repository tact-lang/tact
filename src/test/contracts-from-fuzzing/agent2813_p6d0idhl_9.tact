struct LongStringDefaults {
    title: String = "This is a very long default string meant to test serialization of defaults across large strings in structs.";
}

contract TestLongStringDefault {
    s: LongStringDefaults;

    init() {
        self.s = LongStringDefaults{};
    }
}
