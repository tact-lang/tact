struct DeeplyNested {
    s: String;
    innerOpt: InnerWrap?;
}

struct InnerWrap {
    x: Int;
    flag: Bool;
}

contract NestedOpt {
    data: DeeplyNested;

    init() {
        self.data = DeeplyNested{
            s: "foo",
            innerOpt: InnerWrap{
                x: 12,
                flag: false,
            },
        };
    }
}