struct LongStringDefaults {
    a: String = "a";
    b: String = "bb";
    c: String = "ccc";
    d: String = "dddd";
    e: String = "eeeee";
    f: String = "ffffff";
    g: String = "ggggggg";
}

contract StringDefaults {
    data: LongStringDefaults;

    init() {
        self.data = LongStringDefaults{};
    }
}