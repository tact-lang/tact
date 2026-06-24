struct NestedStrings {
    s1: String;
    s2: String;
}

struct WrapNestedStrings {
    nested: NestedStrings;
    flag: Bool;
    val: Int;
}

contract StructWithNestedStrings {
    wrap: WrapNestedStrings;
    init() {
        self.wrap = WrapNestedStrings{
            nested: NestedStrings{ s1: "a", s2: "b" },
            flag: true,
            val: 42
        };
    }
}