struct NestedLong {
    f0: Int as uint4;
    f1: Int as uint4;
    f2: Int as uint4;
    f3: Int as uint4;
    f4: Int as uint4;
    f5: Int as uint4;
    f6: Int as uint4;
    f7: Int as uint4;
    f8: Int as uint4;
    f9: Int as uint4;
}

struct OuterLong {
    s0: NestedLong;
    s1: NestedLong;
    s2: NestedLong;
    s3: NestedLong;
    s4: NestedLong;
    s5: NestedLong;
    s6: NestedLong;
    s7: NestedLong;
    s8: NestedLong;
    s9: NestedLong;
}

contract TestContract {
    data: OuterLong;

    init() {
        self.data = OuterLong{
            s0: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s1: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s2: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s3: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s4: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s5: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s6: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s7: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s8: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9},
            s9: NestedLong{f0:0,f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9}
        };
    }
}