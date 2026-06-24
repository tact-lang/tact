struct LongStringDefaults {
    s1: String = "abcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghijabcdefghij";
    s2: String = "klmnopqrstklmnopqrstklmnopqrstklmnopqrstklmnopqrstklmnopqrstklmnopqrstklmnopqrst";
}

contract LongDefaultsContract {
    data: LongStringDefaults;

    init() {
        self.data = LongStringDefaults{};
    }
}