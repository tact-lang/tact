struct Large {
    x1:Int;x2:Int;x3:Int;x4:Int;x5:Int;x6:Int;x7:Int;x8:Int;x9:Int;x10:Int;
    x11:Int;x12:Int;x13:Int;x14:Int;x15:Int;x16:Int;x17:Int;x18:Int;x19:Int;x20:Int;
}

contract HugeState {
    large1: Large;
    large2: Large;

    init() {
        self.large1 = Large{
            x1:1,x2:2,x3:3,x4:4,x5:5,x6:6,x7:7,x8:8,x9:9,x10:10,
            x11:11,x12:12,x13:13,x14:14,x15:15,x16:16,x17:17,x18:18,x19:19,x20:20
        };
        self.large2 = Large{
            x1:21,x2:22,x3:23,x4:24,x5:25,x6:26,x7:27,x8:28,x9:29,x10:30,
            x11:31,x12:32,x13:33,x14:34,x15:35,x16:36,x17:37,x18:38,x19:39,x20:40
        };
    }
}