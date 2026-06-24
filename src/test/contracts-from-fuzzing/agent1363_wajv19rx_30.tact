struct InnerDefaults {
    x: Int = 5;
    y: String = "default";
    z: Bool? = null;
}

struct OuterWrap {
    inner: InnerDefaults;
    note: String = "outer";
}

contract NestedDefaultPropagation {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            inner: InnerDefaults{
                y: "override",
            },
            note: "note",
        };
    }
}