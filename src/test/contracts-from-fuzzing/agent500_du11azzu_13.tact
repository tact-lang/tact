struct ManyDefaults {
    a: Int = 1;   b: Int = 2; c: Bool = true;
    d: Bool = false; e: String = ""; f: Int = 0;
}

contract DefaultsBig {
    data: ManyDefaults;
    init() {
        self.data = ManyDefaults{};
    }
    receive() {}
}