struct Deeply {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10:Int;
}

struct Midly {
    a: Deeply;
    b: Deeply;
}

struct Toply {
    left: Midly;
    right: Midly;
}

contract WideDeep {
    val: Toply;

    init() {
        self.val = Toply{
            left: Midly{
                a: Deeply{
                    f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10
                },
                b: Deeply{
                    f1:11,f2:12,f3:13,f4:14,f5:15,f6:16,f7:17,f8:18,f9:19,f10:20
                }
            },
            right: Midly{
                a: Deeply{
                    f1:21,f2:22,f3:23,f4:24,f5:25,f6:26,f7:27,f8:28,f9:29,f10:30
                },
                b: Deeply{
                    f1:31,f2:32,f3:33,f4:34,f5:35,f6:36,f7:37,f8:38,f9:39,f10:40
                }
            }
        };
    }
}