struct RecInner {
    foo: Int;
}

struct RecOuter {
    nested: RecInner;
}

contract RecOptionalStruct {
    innerOpt: RecOuter?;

    init() {
        self.innerOpt = null;
    }
}