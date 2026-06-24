struct InnerDefaults {
    x: Int = 7;
    y: Bool? = null;
    z: String = "hi";
}

struct OuterWrap {
    inner: InnerDefaults;
    note: String;
}

contract NestedDefaults {
    state: OuterWrap;

    init() {
        self.state = OuterWrap{
            inner: InnerDefaults{}, // relying on INNER defaults
            note: "outer"
        };
    }
}