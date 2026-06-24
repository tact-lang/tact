struct MixDeepOpt {
    innerOpt: Int?;
    innerDeepOpt: StructDeepOpt?;
}

struct StructDeepOpt {
    foo: Bool?;
    bar: String?;
}

contract Test22 {
    val: MixDeepOpt;

    init() {
        self.val = MixDeepOpt{
            innerOpt: null,
            innerDeepOpt: null
        };
    }
}