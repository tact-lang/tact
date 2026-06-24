struct LongStringDefaults {
    a: String = "The quick brown fox jumps over the lazy dog";
    b: String = "Lorem ipsum dolor sit amet consectetur adipiscing elit";
}

contract TestLongStringDef {
    data: LongStringDefaults;

    init() {
        self.data = LongStringDefaults{};
    }
}