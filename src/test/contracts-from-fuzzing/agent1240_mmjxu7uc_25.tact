contract DeepMsgOptional {
    root: Wrap;

    init() {
        self.root = Wrap{
            inner: InnerWrap{
                maybe: null
            }
        };
    }
}

struct Wrap {
    inner: InnerWrap;
}

struct InnerWrap {
    maybe: TestMsg?;
}

message(5) TestMsg {
    x: Int?;
}
