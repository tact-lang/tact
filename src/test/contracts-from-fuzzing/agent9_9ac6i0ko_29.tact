struct SerializeVariants {
    a: Int as int32;
    b: Int as uint8;
    c: Int as int1;
}

contract StructSerialized {
    s: SerializeVariants = SerializeVariants{ a: -1, b: 255, c: 1 };

    init() {
        self.s = SerializeVariants{ a: -123, b: 100, c: 0 };
    }
}