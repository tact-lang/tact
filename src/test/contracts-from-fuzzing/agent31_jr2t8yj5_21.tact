struct LongStringDefaults {
    a: String = "a";
    b: String = "b";
    c: String = "c";
    d: String = "d";
    e: String = "e";
    f: String = "f";
    g: String = "g";
    h: String = "h";
}

contract Test {
    data: LongStringDefaults;
    init() {
        self.data = LongStringDefaults{};
    }
}
