struct LongDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    s: String = "x";
    t: String = "y";
    flag: Bool = true;
    flag2: Bool = false;
}

contract TestContract {
    val: LongDefaults;
    init() {
        self.val = LongDefaults{};
    }
}