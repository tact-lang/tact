struct SerializeVariants {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint64;
    d: Int as int257;
}

contract SerContract {
    field: SerializeVariants;

    init() {
        self.field = SerializeVariants{
            a: 1,
            b: -1000,
            c: 10,
            d: -2
        };
    }
}