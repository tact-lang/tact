struct InnerMost {
    val: Int;
}

struct OuterWrap {
    lvl2: MidWrap;
}

struct MidWrap {
    lvl3: InnerMost;
}

contract ChainStruct {
    chain: OuterWrap;
    init() {
        self.chain = OuterWrap{
            lvl2: MidWrap{
                lvl3: InnerMost{ val: 1 }
            }
        };
    }
}