struct BigNest {
    l1: Int;
    l2: Int;
    l3: Int;
    l4: Int;
    l5: Int;
    l6: Int;
    l7: Int;
    l8: Int;
    l9: Int;
    l10: Int;
    l11: Int;
    l12: Int;
    l13: Int;
    l14: Int;
    l15: Int;
    l16: Int;
    l17: Int;
    l18: Int;
    l19: Int;
    l20: Int;
}

struct Wrapper {
    a: BigNest;
    b: BigNest;
    c: BigNest;
}

contract TestContract {
    wrap: Wrapper;

    init() {
        self.wrap = Wrapper{
            a: BigNest{
                l1:1,l2:2,l3:3,l4:4,l5:5,l6:6,l7:7,l8:8,l9:9,l10:10,
                l11:11,l12:12,l13:13,l14:14,l15:15,l16:16,l17:17,l18:18,l19:19,l20:20
            },
            b: BigNest{
                l1:11,l2:12,l3:13,l4:14,l5:15,l6:16,l7:17,l8:18,l9:19,l10:20,
                l11:21,l12:22,l13:23,l14:24,l15:25,l16:26,l17:27,l18:28,l19:29,l20:30
            },
            c: BigNest{
                l1:21,l2:22,l3:23,l4:24,l5:25,l6:26,l7:27,l8:28,l9:29,l10:30,
                l11:31,l12:32,l13:33,l14:34,l15:35,l16:36,l17:37,l18:38,l19:39,l20:40
            }
        };
    }
}