struct OptionalDeep {
    val: Int?;
    s2: S2?;
}

struct S2 {
    flag: Bool?;
}

contract OptionalChain {
    deepOpt: OptionalDeep;
    init() {
        self.deepOpt = OptionalDeep{
            val: null,
            s2: null,
        };
    }
}