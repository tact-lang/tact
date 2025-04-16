struct Deep {
    a: Int;
    b: Int;
    c: Int;
}

struct Mid {
    deep1: Deep;
    deep2: Deep;
}

struct Top {
    mid1: Mid;
    mid2: Mid;
}

contract WideNested {
    data: Top;

    init() {
        self.data = Top{
            mid1: Mid{
                deep1: Deep{a:1,b:2,c:3},
                deep2: Deep{a:4,b:5,c:6}
            },
            mid2: Mid{
                deep1: Deep{a:7,b:8,c:9},
                deep2: Deep{a:10,b:11,c:12}
            }
        };
    }
}