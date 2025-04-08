struct LargeStringDefaults {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
    e: String = "e";
    f: String = "f";
    g: String = "g";
    h: String = "h";
    i: String = "i";
    j: String = "j";
}

contract LargeStringDefaultsTest {
    val: LargeStringDefaults;

    init() {
        self.val = LargeStringDefaults{};
    }
}