struct LongStringDefaults {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";
    s5: String = "e";
    s6: String = "f";
    s7: String = "g";
    s8: String = "h";
    s9: String = "i";
    s10: String = "j";
}

contract StorageTest {
    val: LongStringDefaults;

    init() {
        self.val = LongStringDefaults{};
    }
}