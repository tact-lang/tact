struct LongStringDefaults {
    title: String = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
    subtitle: String = "bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb";
    content: String = "cccccccccccccccccccccccccccccccccccccccccccccccccc";
}

contract LongStrDefTest {
    vals: LongStringDefaults;

    init() {
        self.vals = LongStringDefaults{};
    }
}