struct WideNested {
    f01: Int;
    f02: Int;
    f03: Int;
    f04: Int;
    f05: Int;
    f06: Int;
    f07: Int;
    f08: Int;
    f09: Int;
    f10: Int;
}

contract TestContract {
    s1: WideNested;
    s2: WideNested;
    s3: WideNested;
    init() {
        self.s1 = WideNested{f01:1,f02:2,f03:3,f04:4,f05:5,f06:6,f07:7,f08:8,f09:9,f10:10};
        self.s2 = WideNested{f01:11,f02:12,f03:13,f04:14,f05:15,f06:16,f07:17,f08:18,f09:19,f10:20};
        self.s3 = WideNested{f01:21,f02:22,f03:23,f04:24,f05:25,f06:26,f07:27,f08:28,f09:29,f10:30};
    }
}
