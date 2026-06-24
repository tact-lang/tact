struct NestedLarge {
    outer1: Large;
    outer2: Large;
}

struct Large {
    f0: Int;
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
}

contract NestedLargeContract {
    data: NestedLarge;
    
    init() {
        self.data = NestedLarge{
            outer1: Large{
                f0:1,f1:2,f2:3,f3:4,f4:5,f5:6,f6:7,f7:8,f8:9,f9:10
            },
            outer2: Large{
                f0:11,f1:12,f2:13,f3:14,f4:15,f5:16,f6:17,f7:18,f8:19,f9:20
            }
        };
    }
}