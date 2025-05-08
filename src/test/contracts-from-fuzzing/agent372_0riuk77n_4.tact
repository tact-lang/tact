struct Deep {
    a: Int;
    b: Bool;
}

struct Middle {
    d: Deep;
    opt: Bool?;
}

struct OuterMost {
    m: Middle;
    optNum: Int?;
}

contract DeeplyNestedOptional {
    snapshot: OuterMost;

    init() {
        self.snapshot = OuterMost{
            m: Middle{d: Deep{a:5,b:true}, opt: null},
            optNum: 7
        };
    }
}