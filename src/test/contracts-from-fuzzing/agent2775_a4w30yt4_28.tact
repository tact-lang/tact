struct BigDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "foo";
    d: Int = 0;
    e: Bool = false;
    f: String = "bar";
}

contract ManyDefaults {
    s: BigDefaults;

    init() {
        self.s = BigDefaults{};
    }
}
