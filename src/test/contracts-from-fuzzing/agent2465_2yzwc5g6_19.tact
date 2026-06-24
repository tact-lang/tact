struct InnerMost {
    i: Int;
    b: Bool;
    s: String;
}

struct InnerWrap {
    obj: InnerMost;
}

struct MidWrap {
    obj: InnerWrap;
}

struct OuterWrap {
    obj: MidWrap;
}

contract TestContract {
    data: OuterWrap;

    init() {
        self.data = OuterWrap{
            obj: MidWrap{
                obj: InnerWrap{
                    obj: InnerMost{
                        i: 5,
                        b: true,
                        s: "text"
                    }
                }
            }
        };
    }
}