struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String? = null;
}

contract TestContract {
    v: ManyDefaults;

    init() {
        self.v = ManyDefaults{};
    }

    receive() {
        let q = self.v;
    }
}