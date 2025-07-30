struct LongDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "c";
    d: Int = 2;
    e: Bool = false;
    f: String = "f";
    g: Int = 3;
    h: Bool = true;
    i: String = "i";
    j: Int = 4;
    k: Bool = false;
    l: String = "l";
}

contract LongDefaultStructContract {
    val: LongDefaults;

    init() {
        self.val = LongDefaults{};
    }
}