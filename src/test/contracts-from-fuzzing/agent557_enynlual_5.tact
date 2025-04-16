struct InnerMost {
    value: Int?;
}

struct Mid {
    i1: InnerMost;
    i2: InnerMost;
}

struct Outer {
    m1: Mid;
    m2: Mid;
    flag: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            m1: Mid{
                i1: InnerMost{value:null},
                i2: InnerMost{value:null}
            },
            m2: Mid{
                i1: InnerMost{value:null},
                i2: InnerMost{value:null}
            },
            flag:true
        };
    }
}