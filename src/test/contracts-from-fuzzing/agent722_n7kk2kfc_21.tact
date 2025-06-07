struct MixInnerOpt {
    str: String?;
    boo: Bool?;
}

struct MixOuter {
    i: Int;
    inner: MixInnerOpt?;
}

contract OptStructs {
    val: MixOuter;

    init() {
        self.val = MixOuter{
            i: 5,
            inner: MixInnerOpt{
                str: null,
                boo: true,
            },
        };
    }
}