// test large nested struct with many default null optionals, few set explicitly
struct ManyDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int? = null;
    h: Bool? = null;
    i: String? = null;
}

contract PartialOverride {
    store: ManyDefaults;

    init() {
        self.store = ManyDefaults{
            a: 42,
            e: true,
            i: "non-null",
        };
    }
}