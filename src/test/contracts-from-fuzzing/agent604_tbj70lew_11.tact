struct TenInts {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
}

struct Container {
    t1: TenInts;
    t2: TenInts;
    t3: TenInts;
    t4: TenInts;
}

contract BigStructStorage {
    big: Container;

    init() {
        self.big = Container{
            t1: TenInts{ i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10 },
            t2: TenInts{ i1:11,i2:12,i3:13,i4:14,i5:15,i6:16,i7:17,i8:18,i9:19,i10:20 },
            t3: TenInts{ i1:21,i2:22,i3:23,i4:24,i5:25,i6:26,i7:27,i8:28,i9:29,i10:30 },
            t4: TenInts{ i1:31,i2:32,i3:33,i4:34,i5:35,i6:36,i7:37,i8:38,i9:39,i10:40 }
        };
    }

    receive() {
        let _ = self.big;
    }
}