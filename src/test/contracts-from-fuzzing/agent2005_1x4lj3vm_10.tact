struct Sub {
    x: Int;
    y: Bool;
}

struct Mid {
    s1: Sub;
    s2: Sub;
}

struct Top {
    m1: Mid;
    m2: Mid;
}

contract DeeplyNested {
    all: Top;

    init() {
        self.all = Top{
            m1: Mid{
                s1: Sub{x:1,y:true},
                s2: Sub{x:2,y:false}
            },
            m2: Mid{
                s1: Sub{x:3,y:true},
                s2: Sub{x:4,y:false}
            },
        };
    }
}