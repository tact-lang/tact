struct InnerMost {
    val: Int;
}

struct InnerWrap {
    inn: InnerMost;
}

struct MiddleWrap {
    inner: InnerWrap;
}

struct OuterWrap {
    middle: MiddleWrap;
}

contract DeeplyWrapped {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            middle: MiddleWrap{
                inner: InnerWrap{
                    inn: InnerMost{ val: 123 }
                }
            }
        };
    }
}