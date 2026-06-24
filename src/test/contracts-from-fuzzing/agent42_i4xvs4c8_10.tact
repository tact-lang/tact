struct OuterMost {
    x: Int;
    y: Int; 
    z: Int;
}

struct Middle {
    a: OuterMost;
    b: OuterMost;
    c: OuterMost;
}

struct TopLevel {
    left: Middle;
    right: Middle;
}

contract WideDeepNest {
    bigStruct: TopLevel;

    init() {
        self.bigStruct = TopLevel{
            left: Middle{
                a: OuterMost{x:1,y:2,z:3},
                b: OuterMost{x:4,y:5,z:6},
                c: OuterMost{x:7,y:8,z:9}
            },
            right: Middle{
                a: OuterMost{x:10,y:11,z:12},
                b: OuterMost{x:13,y:14,z:15},
                c: OuterMost{x:16,y:17,z:18}
            }
        };
    }
}