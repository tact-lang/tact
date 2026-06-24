struct MultiLevel1 {
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
}

struct MultiLevel2 {
    s1: MultiLevel1;
    s2: MultiLevel1;
}

contract TestContract {
    storage: MultiLevel2;

    init() {
        self.storage = MultiLevel2{
            s1: MultiLevel1{
                lv1:1,lv2:2,lv3:3,lv4:4,lv5:5,lv6:6,lv7:7,lv8:8,lv9:9,lv10:10,
            },
            s2: MultiLevel1{
                lv1:11,lv2:12,lv3:13,lv4:14,lv5:15,lv6:16,lv7:17,lv8:18,lv9:19,lv10:20,
            },
        };
    }
}