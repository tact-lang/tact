struct LongOrder {
    f1: Int as int8;
    f2: Int as int16;
    f3: Int as int32;
    f4: Int as int64;
    f5: Int as int128;
    f6: Int as int257;
}

contract SerializationOrder {
    s: LongOrder;
    init() {
        self.s = LongOrder{
            f1: 1,
            f2: 2,
            f3: 3,
            f4: 4,
            f5: 5,
            f6: 6
        };
    }
}
