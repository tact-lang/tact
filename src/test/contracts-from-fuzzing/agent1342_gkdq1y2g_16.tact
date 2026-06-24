// test deeply nested optional fields with mixed primitives
struct InnerMost {
    flag: Bool?;
    text: String?;
    num: Int?;
}

struct Middle {
    inner1: InnerMost?;
    inner2: InnerMost;
    someInt: Int;
}

struct Outer {
    middleOpt: Middle?;
    middle: Middle;
}

contract OptionalDeep {
    state: Outer;

    init() {
        self.state = Outer{
            middleOpt: null,
            middle: Middle{
                inner1: null,
                inner2: InnerMost{ flag:true, text:"abc", num:null },
                someInt: 5
            }
        };
    }
}