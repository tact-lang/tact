struct Deep {
    a: Int;
    b: Bool?;
}

struct Mid {
    d1: Deep;
    d2: Deep;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract ComplexStorage {
    data: Top;

    init() {
        self.data = Top{
            m1: Mid{
                d1: Deep{a:1, b:true}, d2: Deep{a:2, b:null}
            },
            m2: Mid{
                d1: Deep{a:3, b:false}, d2: Deep{a:4, b:true}
            },
        };
    }
}