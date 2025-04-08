struct ManyLevels {
    lv1: Int;
    lv2: Int;
    lv3: Int;
    lv4: Int;
    lv5: Int;
    lv6: Int;
    lv7: Int;
    lv8: Int;
    lv9: Int;
    lv10: Int;
    lv11: Int;
    lv12: Int;
    lv13: Int;
    lv14: Int;
    lv15: Int;
    lv16: Int;
}

contract Test {
    s: ManyLevels;

    init() {
        self.s = ManyLevels{
            lv1:1,lv2:2,lv3:3,lv4:4,lv5:5,lv6:6,lv7:7,lv8:8,
            lv9:9,lv10:10,lv11:11,lv12:12,lv13:13,lv14:14,lv15:15,lv16:16
        };
    }
}
