struct DeeplyNested {
    d1: Int;
    d2: Bool;
}

struct Middle {
    m1: Int;
    nested: DeeplyNested;
}

struct Top {
    t1: Bool;
    middle: Middle;
}

contract Test4 {
    big: Top;
    
    init() {
        self.big = Top{t1: true, middle: Middle{m1: 5, nested: DeeplyNested{d1: 7, d2: false}}};
    }
}
