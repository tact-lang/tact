struct BigNested {
    f1: Int; f2: Int; f3: Int; f4: Int; f5: Int;
    f6: Int; f7: Int; f8: Int; f9: Int; f10: Int;
}

contract NestedList {
    n1: BigNested;
    n2: BigNested;
    n3: BigNested;

    init() {
        self.n1 = BigNested{f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10};
        self.n2 = BigNested{f1:11,f2:12,f3:13,f4:14,f5:15,f6:16,f7:17,f8:18,f9:19,f10:20};
        self.n3 = BigNested{f1:21,f2:22,f3:23,f4:24,f5:25,f6:26,f7:27,f8:28,f9:29,f10:30};
    }
}