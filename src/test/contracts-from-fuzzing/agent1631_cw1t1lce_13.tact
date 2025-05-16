struct NestedArray {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Int;
    a6: Int;
    a7: Int;
    a8: Int;
    a9: Int;
    a10: Int;
}

struct UpperStruct {
    n1: NestedArray;
    n2: NestedArray;
    n3: NestedArray;
}

contract ManyNested {
    u: UpperStruct;

    init() {
        self.u = UpperStruct{
            n1: NestedArray{
                a1:1,a2:2,a3:3,a4:4,a5:5,a6:6,a7:7,a8:8,a9:9,a10:10
            },
            n2: NestedArray{
                a1:11,a2:12,a3:13,a4:14,a5:15,a6:16,a7:17,a8:18,a9:19,a10:20
            },
            n3: NestedArray{
                a1:21,a2:22,a3:23,a4:24,a5:25,a6:26,a7:27,a8:28,a9:29,a10:30
            },
        };
    }
}