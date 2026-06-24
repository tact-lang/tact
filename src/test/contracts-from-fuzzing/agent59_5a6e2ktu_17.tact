struct BigNest {
    s1: Int;
    s2: Int;
    s3: Int;
    s4: Int;
    s5: Int;
    s6: Int;
    s7: Int;
    s8: Int;
    s9: Int;
    s10: Int;

    s11: Int;
    s12: Int;
    s13: Int;
    s14: Int;
    s15: Int;
    s16: Int;
    s17: Int;
    s18: Int;
    s19: Int;
    s20: Int;
}

struct TopStruct {
    n1: BigNest;
    n2: BigNest;
    n3: BigNest;
}

contract LargeNestTest {
    val: TopStruct;

    init() {
        self.val = TopStruct{
            n1: BigNest{
                s1:1,s2:2,s3:3,s4:4,s5:5,s6:6,s7:7,s8:8,s9:9,s10:10,
                s11:11,s12:12,s13:13,s14:14,s15:15,s16:16,s17:17,s18:18,s19:19,s20:20
            },
            n2: BigNest{
                s1:21,s2:22,s3:23,s4:24,s5:25,s6:26,s7:27,s8:28,s9:29,s10:30,
                s11:31,s12:32,s13:33,s14:34,s15:35,s16:36,s17:37,s18:38,s19:39,s20:40
            },
            n3: BigNest{
                s1:41,s2:42,s3:43,s4:44,s5:45,s6:46,s7:47,s8:48,s9:49,s10:50,
                s11:51,s12:52,s13:53,s14:54,s15:55,s16:56,s17:57,s18:58,s19:59,s20:60
            }
        };
    }
}