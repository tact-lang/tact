struct S {
    int1: Int as uint8;
    int2: Int as int4;
    int3: Int as uint16;
    int4: Int as int32;
    int5: Int as uint64;
}

contract SerContract {
    field: S;
    init() {
        self.field = S{ int1: 1, int2: -3, int3: 10, int4: -11, int5:12 };
    }
}