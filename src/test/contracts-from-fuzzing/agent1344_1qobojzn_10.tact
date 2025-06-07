struct InnerFixed {
    x: Int;
    y: Int;
}

struct Wrap {
    fixed: InnerFixed;
    optionalInner: InnerFixed?;
    optionalStr: String?;
}

contract OptionalFixedMix {
    val: Wrap;

    init() {
        self.val = Wrap{
            fixed: InnerFixed{x:1,y:2},
            optionalInner: null,
            optionalStr: null
        };
    }
}
