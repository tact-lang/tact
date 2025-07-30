struct LongDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
}

contract DefaultsInStruct {
    val: LongDefaults;

    init() {
        self.val = LongDefaults{};
    }
}