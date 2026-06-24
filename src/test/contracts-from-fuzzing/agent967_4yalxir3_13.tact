struct Wrap {
    s: InnerWrap;
}

struct InnerWrap {
    s: DeepWrap;
}

struct DeepWrap {
    s: Int?;
}

contract OptionalWrapDeep {
    data: Wrap;

    init() {
        self.data = Wrap{
            s: InnerWrap{
                s: DeepWrap{
                    s: null
                }
            }
        };
    }
}