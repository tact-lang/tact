struct OptionalWrap {
    nestedOpt: InnerStruct?;
}

struct InnerStruct {
    str: String;
}

contract OptionalOuter {
    data: OptionalWrap;

    init() {
        self.data = OptionalWrap{
            nestedOpt: null
        };
    }
}