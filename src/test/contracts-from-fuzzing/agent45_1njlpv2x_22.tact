struct SerTest {
    a: Int as uint8;
    b: Int as int16;
    c: Int as uint64;
}

contract SerializationVariants {
    st: SerTest;

    init() {
        self.st = SerTest{ a: 1, b: -2, c: 3 };
    }
}
