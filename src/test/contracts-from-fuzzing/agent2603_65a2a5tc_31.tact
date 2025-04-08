struct BaseWrap {
    base: Int;
}

struct MidWrap {
    inner: BaseWrap;
}

struct TopWrap {
    nested: MidWrap;
}

contract ChainAssigns {
    chain: TopWrap;

    init() {
        self.chain = TopWrap{
            nested: MidWrap{
                inner: BaseWrap{
                    base: 101
                }
            }
        };
    }
}
