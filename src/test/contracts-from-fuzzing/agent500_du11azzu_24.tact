struct OptionWithNested {
    i: Int?;
    b: Bool?;
    s: String?;
}

struct OuterOptWithDefaults {
    inner: OptionWithNested? = null;
    flag: Bool = false;
}

contract OptOptDefaults {
    data: OuterOptWithDefaults;
    init() {
        self.data = OuterOptWithDefaults{};
    }
    receive() {}
}