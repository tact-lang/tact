struct MixNested {
    intf: Int;
    optBool: Bool?;
    inner: NestedInnerTwo;
}

struct NestedInnerTwo {
    text: String;
    other: Bool;
    maybeText: String?;
}

contract MixedStructs {
    s: MixNested;

    init() {
        self.s = MixNested{
            intf: 42,
            optBool: null,
            inner: NestedInnerTwo{
                text: "ok",
                other: true,
                maybeText: null
            }
        };
    }
}