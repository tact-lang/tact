struct Leaf {
    x: Int;
    y: Bool;
}

struct MiddleOpt {
    leaf: Leaf?;
    s: String;
}

struct TopLevel {
    m1: MiddleOpt;
    m2: MiddleOpt?;
    extra: Int?;
}

contract ManyOptionalNested {
    t: TopLevel;

    init() {
        self.t = TopLevel{
            m1: MiddleOpt{leaf:null,s:"a"},
            m2: MiddleOpt{leaf:Leaf{x:5,y:true},s:"b"},
            extra: null
        };
    }
}