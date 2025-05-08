struct DeepWrap {
    inner: Int?;
}

struct MidWrap {
    wrapped: DeepWrap;
}

struct OuterWrap {
    payload: MidWrap;
}

contract ThreeLevelWrapper {
    state: OuterWrap;

    init() {
        self.state = OuterWrap{
            payload: MidWrap{
                wrapped: DeepWrap{
                    inner: 123
                }
            }
        };
    }
}