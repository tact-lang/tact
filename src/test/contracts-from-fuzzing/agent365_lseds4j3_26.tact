struct StrOpt {
    s: String?;
}

struct MixedOpt {
    flag: Bool;
    num: Int?;
    inner: StrOpt?;
}

contract NestedOptionals {
    part: MixedOpt;

    init() {
        self.part = MixedOpt{
            flag: false,
            num: null,
            inner: null
        };
    }
}