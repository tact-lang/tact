struct NestedBoolWrap {
    wrap: WrapLevel;
}

struct WrapLevel {
    inside: InnerWrap;
}

struct InnerWrap {
    deeper: BoolWrap;
}

struct BoolWrap {
    flag: Bool;
}

contract BoolDeepNest {
    nested: NestedBoolWrap;
    init() {
        self.nested = NestedBoolWrap{
            wrap: WrapLevel{
                inside: InnerWrap{
                    deeper: BoolWrap{
                        flag: true
                    }
                }
            }
        };
    }
}