struct StrBoolOpt {
    s: String;
    b: Bool?;
}

struct IntNest {
    val: Int;
    nb: StrBoolOpt;
}

contract NestedMix {
    field: IntNest;

    init() {
        self.field = IntNest{
            val: 10,
            nb: StrBoolOpt{ s: "x", b: null }
        };
    }
}
