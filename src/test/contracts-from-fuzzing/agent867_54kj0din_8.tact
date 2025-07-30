struct WithDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "str";
    d: Int?; // defaults implicitly to null
    e: Bool?; // defaults implicitly to null
    f: String?; // defaults implicitly to null
}

contract TestContract {
    rec: WithDefaults = WithDefaults{};

    init() {
        self.rec = WithDefaults{
            a: 100,
            b: false,
            c: "mod",
            d: 42,
            e: true,
            f: "nonnull"
        };
    }
}
