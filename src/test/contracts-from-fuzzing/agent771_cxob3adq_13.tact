struct X {
    i1: Int; i2: Int; i3: Int; i4: Int; i5: Int;
    i6: Int; i7: Int; i8: Int; i9: Int; i10: Int;
}

contract BigStorage {
    big: X = X{
        i1:1,i2:2,i3:3,i4:4,i5:5,i6:6,i7:7,i8:8,i9:9,i10:10
    };

    init() {
        self.big = X{
            i1:11,i2:12,i3:13,i4:14,i5:15,i6:16,i7:17,i8:18,i9:19,i10:20
        };
    }
}