struct OptionalDeep {
    s: String?;
    nested: NestedOpt?;
}

struct NestedOpt {
    val: Int?;
    flag: Bool?;
}

contract OptStruct {
    f: OptionalDeep;

    init() {
        self.f = OptionalDeep{
            s: null,
            nested: NestedOpt{
                val: null,
                flag: true
            }
        };
    }
}
