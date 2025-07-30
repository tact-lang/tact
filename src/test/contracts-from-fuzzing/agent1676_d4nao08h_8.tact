struct Leaf {
    leafVal: Int;
}

struct Middle {
    leafOpt: Leaf?;
}

struct Top {
    middle: Middle;
}

contract OptNestedStruct {
    data: Top;
    init() {
        self.data = Top{
            middle: Middle{
                leafOpt: null
            }
        };
    }
}
