struct SWithDefaults {
    a: Int = 5;
    b: String = "default";
    c: Bool = true;
}

contract DefaultsComb {
    v: SWithDefaults;

    init() {
        self.v = SWithDefaults{ a: 123, b: "abc", c: false };
    }
}