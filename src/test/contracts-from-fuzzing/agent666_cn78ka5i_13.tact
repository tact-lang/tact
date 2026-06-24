struct Levels {
    p1: Int; p2: Int; p3: Int; p4: Int; p5: Int;
    p6: Int; p7: Int; p8: Int; p9: Int; p10: Int;
}

contract Bulk {
    x: Levels;
    y: Levels;
    z: Levels;

    init() {
        self.x=Levels{p1:1,p2:2,p3:3,p4:4,p5:5,p6:6,p7:7,p8:8,p9:9,p10:10};
        self.y=Levels{p1:11,p2:12,p3:13,p4:14,p5:15,p6:16,p7:17,p8:18,p9:19,p10:20};
        self.z=Levels{p1:21,p2:22,p3:23,p4:24,p5:25,p6:26,p7:27,p8:28,p9:29,p10:30};
    }
}
