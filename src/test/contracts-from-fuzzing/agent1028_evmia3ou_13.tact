struct SparseBits {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    b6: Bool?;
    b7: Bool?;
    b8: Bool?;
    b9: Bool?;
    b10: Bool?;
    b11: Bool?;
    b12: Bool?;
    b13: Bool?;
    b14: Bool?;
    b15: Bool?;
    b16: Bool?;
    b17: Bool?;
    b18: Bool?;
    b19: Bool?;
    b20: Bool?;
}

contract OptionalBitsTest {
    flags: SparseBits;

    init() {
        self.flags = SparseBits{
            b1: null,
            b2: true,
            b3: null,
            b4: false,
            b5: null,
            b6: false,
            b7: null,
            b8: null,
            b9: true,
            b10: null,
            b11: null,
            b12: false,
            b13: true,
            b14: null,
            b15: false,
            b16: null,
            b17: true,
            b18: null,
            b19: false,
            b20: null,
        };
    }
}
