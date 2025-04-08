struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int?;
    e: Bool?;
}

contract InitOverride {
    vals: Defaults;

    init() {
        self.vals = Defaults{
            a: 100,
            b: false,
            c: "bye",
            d: null,
            e: null
        };
    }
}
