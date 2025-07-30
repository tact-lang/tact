struct InnerMost {
    val: Int;
}

struct InnerWrap {
    i: InnerMost;
    s: String;
}

struct MiddleLayer {
    wrap: InnerWrap;
    flag: Bool;
}

contract NestedAndMixed {
    nested: MiddleLayer;

    init(){
        self.nested = MiddleLayer{
            wrap: InnerWrap{
                i: InnerMost{val:11},
                s: "str"
            },
            flag: true
        };
    }
}