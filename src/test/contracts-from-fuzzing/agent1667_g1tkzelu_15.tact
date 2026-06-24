struct InnerLong {
    v1: Int;
    v2: Int;
    v3: Int;
    v4: Int;
    v5: Int;
    v6: Int;
    v7: Int;
    v8: Int;
    v9: Int;
    v10: Int;
}

struct OuterLong {
    i1: InnerLong;
    i2: InnerLong;
}

contract Lots {
    rec: OuterLong;
    init() {
        self.rec = OuterLong{
            i1: InnerLong{
                v1:1,v2:2,v3:3,v4:4,v5:5,v6:6,v7:7,v8:8,v9:9,v10:10
            },
            i2: InnerLong{
                v1:11,v2:12,v3:13,v4:14,v5:15,v6:16,v7:17,v8:18,v9:19,v10:20
            }
        };
    }
}
