struct BigNested {
    l1: Int;
    l2: Bool;
}

struct BigMid {
    m1: BigNested;
    m2: BigNested;
    m3: BigNested;
    m4: BigNested;
    m5: BigNested;
}

struct BigTop {
    t1: BigMid;
    t2: BigMid;
}

contract BigTree {
    root: BigTop;

    init() {
        self.root = BigTop{
            t1: BigMid{
                m1: BigNested{ l1:1, l2:true },
                m2: BigNested{ l1:2, l2:false },
                m3: BigNested{ l1:3, l2:true },
                m4: BigNested{ l1:4, l2:false },
                m5: BigNested{ l1:5, l2:true }
            },
            t2: BigMid{
                m1: BigNested{ l1:6, l2:false },
                m2: BigNested{ l1:7, l2:true },
                m3: BigNested{ l1:8, l2:false },
                m4: BigNested{ l1:9, l2:true },
                m5: BigNested{ l1:10, l2:false }
            }
        };
    }
}