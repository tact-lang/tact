struct MixNest {
    inner_int: Int;
    inner_str: String;
}

struct MixOuter {
    flag: Bool;
    opt_str: String?;
    nested: MixNest;
}

contract Combined {
    xx: MixOuter;

    init() {
        self.xx = MixOuter{
            flag: true,
            opt_str: null,
            nested: MixNest{
                inner_int: 7,
                inner_str: "ok"
            }
        };
    }
}