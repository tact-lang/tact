struct InnerOpt {
    v: Int;
}

struct MidWrap {
    maybeInner: InnerOpt?;
    label: String;
}

contract NestedOptStruct {
    data: MidWrap;

    init() {
        self.data = MidWrap{maybeInner: null, label: "hi"};
    }
}