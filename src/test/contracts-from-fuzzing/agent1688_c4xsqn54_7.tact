struct BigNested {
    inner1: Int;
    inner2: Int;
    inner3: Int;
    inner4: Int;
    inner5: Int;
    inner6: Int;
    inner7: Int;
    inner8: Int;
    inner9: Int;
    inner10: Int;
}

struct OuterLarge {
    first: BigNested;
    second: BigNested;
    third: BigNested;
}

contract ManyNested {
    data: OuterLarge;

    init() {
        self.data = OuterLarge{
            first: BigNested{
                inner1:1,inner2:2,inner3:3,inner4:4,inner5:5,
                inner6:6,inner7:7,inner8:8,inner9:9,inner10:10
            },
            second: BigNested{
                inner1:11,inner2:12,inner3:13,inner4:14,inner5:15,
                inner6:16,inner7:17,inner8:18,inner9:19,inner10:20
            },
            third: BigNested{
                inner1:21,inner2:22,inner3:23,inner4:24,inner5:25,
                inner6:26,inner7:27,inner8:28,inner9:29,inner10:30
            }
        };
    }
}