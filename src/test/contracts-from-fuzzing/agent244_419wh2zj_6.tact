struct NestedOpt {
    innerOpt: Int?;
    text: String;
}

struct TopStruct {
    inner: NestedOpt?;
    flag: Bool;
}

contract OptionalDeep {
    data: TopStruct;

    init() {
        self.data = TopStruct{
            inner: NestedOpt{
                innerOpt: null,
                text: "abc",
            },
            flag: false,
        };
    }
}