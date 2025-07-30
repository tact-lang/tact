struct BigDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String = "world";
}

contract DefaultVals {
    store: BigDefaults;

    init() {
        self.store = BigDefaults{};
    }
}