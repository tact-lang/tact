struct DeepArray {
    f1: Int;
    f2: Int;
    f3: Int;
    f4: Int;
    f5: Int;
    f6: Int;
    f7: Int;
    f8: Int;
    f9: Int;
    f10: Int;
    f11: Int;
    f12: Int;
    f13: Int;
    f14: Int;
    f15: Int;
    f16: Int;
    f17: Int;
    f18: Int;
    f19: Int;
    f20: Int;
}

struct Container {
    arr1: DeepArray;
    arr2: DeepArray;
    arr3: DeepArray;
}

contract LargeStructFields {
    c: Container;
    init() {
        self.c = Container{
            arr1: DeepArray{
                f1:1,f2:2,f3:3,f4:4,f5:5,f6:6,f7:7,f8:8,f9:9,f10:10,
                f11:11,f12:12,f13:13,f14:14,f15:15,f16:16,f17:17,f18:18,f19:19,f20:20
            },
            arr2: DeepArray{
                f1:21,f2:22,f3:23,f4:24,f5:25,f6:26,f7:27,f8:28,f9:29,f10:30,
                f11:31,f12:32,f13:33,f14:34,f15:35,f16:36,f17:37,f18:38,f19:39,f20:40
            },
            arr3: DeepArray{
                f1:41,f2:42,f3:43,f4:44,f5:45,f6:46,f7:47,f8:48,f9:49,f10:50,
                f11:51,f12:52,f13:53,f14:54,f15:55,f16:56,f17:57,f18:58,f19:59,f20:60
            }
        };
    }
}