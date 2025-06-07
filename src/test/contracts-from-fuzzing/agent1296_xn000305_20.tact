struct BigDefaults {
    a: Int = 10;
    b: Bool = false;
    c: Int = 20;
    d: Bool = true;
    e: Int = 30;
    f: Bool = false;
    g: Int = 40;
    h: Bool = true;
}

contract TestContract {
    val: BigDefaults;
    init() {
        self.val = BigDefaults{};
    }
}