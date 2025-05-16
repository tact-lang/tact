struct InnerMost {
    a: Int;
    b: Bool?;
}

struct Middle {
    nested: InnerMost;
    optInt: Int?;
}

struct Outer {
    m1: Middle;
    m2: Middle;
}

contract MultiNested {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Middle{nested: InnerMost{a:1,b:true}, optInt: null},
            m2: Middle{nested: InnerMost{a:2,b:false}, optInt: 42}
        };
    }
}