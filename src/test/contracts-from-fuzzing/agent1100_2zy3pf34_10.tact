struct SDeepOpt {
    opt: Int?;
    flag: Bool;
}

struct SHasOpt {
    nested: SDeepOpt;
    altOpt: Bool?;
}

contract StructOptionalFields {
    s: SHasOpt;

    init() {
        self.s = SHasOpt{
            nested: SDeepOpt{ opt: null, flag: false },
            altOpt: null
        };
    }
}
