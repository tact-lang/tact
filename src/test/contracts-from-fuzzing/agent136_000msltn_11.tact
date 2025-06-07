struct S1 {
    f1: Int as int64;
    f2: Int as uint8;
    f3: Int as int4;
    f4: Int as uint4;
}

contract SerializationMix {
    data: S1;

    init() {
        self.data = S1{f1:1,f2:2,f3:3,f4:4};
    }
}