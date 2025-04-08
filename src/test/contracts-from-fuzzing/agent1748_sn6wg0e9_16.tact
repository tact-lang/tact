struct SerializeVariants {
    a: Int as int8;
    b: Int as uint16;
    c: Int as int64;
}

contract TestContract {
    data: SerializeVariants;

    init() {
        self.data = SerializeVariants{
            a: -10,
            b: 65535,
            c: 123456789
        };
    }
}