struct BoolFirst {
    ok: Bool;
    nested: NestedS;
}

struct NestedS {
    val: Int;
    str: String;
}

contract BoolFirstContract {
    data: BoolFirst;

    init() {
        self.data = BoolFirst{
            ok: true,
            nested: NestedS{
                val: 77,
                str: "qqq"
            }
        };
    }
}
