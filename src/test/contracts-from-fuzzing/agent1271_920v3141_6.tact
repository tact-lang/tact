struct InnerMost {
    x: Int;
    y: Bool;
}

struct Mid {
    im: InnerMost;
    s: String;
    optim: InnerMost?;
}

struct OuterMost {
    m1: Mid;
    m2: Mid;
    optionalM: Mid?;
    text: String;
}

contract DeepNest {
    state: OuterMost;
    init() {
        self.state = OuterMost{
            m1: Mid{im: InnerMost{x:0,y:false}, s:"", optim:null},
            m2: Mid{im: InnerMost{x:1,y:true}, s:"", optim:null},
            optionalM: null,
            text: ""
        };
    }
}