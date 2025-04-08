struct NestedStringOpt {
    val: String?;
}

struct OuterStr {
    nested: NestedStringOpt;
}

contract OptStringOuter {
    s: OuterStr;

    init() {
        self.s = OuterStr{
            nested: NestedStringOpt{
                val: null
            }
        };
    }
}