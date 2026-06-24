struct ArrayEmu {
    i0: Int;
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
}

contract ArrayLike {
    data: ArrayEmu = ArrayEmu{ i0:0,i1:1,i2:2,i3:3,i4:4 };

    init() {
        self.data = ArrayEmu{ i0:10,i1:11,i2:12,i3:13,i4:14 };
    }
}