struct Sub {
    a: Int;
    b: Bool;
}

struct Mid {
    sub1: Sub;
    sub2: Sub;
}

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract MultiNested {
    state: Top;

    init() {
        self.state = Top{
            mid1: Mid{
                sub1: Sub{a:1,b:true},
                sub2: Sub{a:2,b:false}
            },
            mid2: Mid{
                sub1: Sub{a:3,b:true},
                sub2: Sub{a:4,b:false}
            }
        };
    }
}