struct InnerMost {
    a: Int;
    b: Bool;
}

struct Middle {
    c: InnerMost;
    d: String?;
}

contract OptionalMiddleNested {
    m: Middle;
    
    init() {
        self.m = Middle{ c: InnerMost{a:1,b:true}, d: null };
    }
}