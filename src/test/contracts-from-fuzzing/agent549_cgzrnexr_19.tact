struct Leaf {
    v1: Int;
    v2: Bool;
}

struct Middle {
    m1: Leaf;
    m2: Leaf;
    m3: Leaf;
}

struct Top {
    t1: Middle;
    t2: Middle;
    flag: Bool;
}

contract MultiLeaves {
    f: Top;

    init() {
        self.f = Top{
            t1: Middle{
                m1: Leaf{ v1:1,v2:true },
                m2: Leaf{ v1:2,v2:false },
                m3: Leaf{ v1:3,v2:true },
            },
            t2: Middle{
                m1: Leaf{ v1:4,v2:false },
                m2: Leaf{ v1:5,v2:true },
                m3: Leaf{ v1:6,v2:false },
            },
            flag: true,
        };
    }

    receive() {
        self.f = Top{
            t1: Middle{
                m1: Leaf{ v1:7,v2:false },
                m2: Leaf{ v1:8,v2:true },
                m3: Leaf{ v1:9,v2:false },
            },
            t2: Middle{
                m1: Leaf{ v1:10,v2:true },
                m2: Leaf{ v1:11,v2:false },
                m3: Leaf{ v1:12,v2:true },
            },
            flag: false,
        };
    }
}