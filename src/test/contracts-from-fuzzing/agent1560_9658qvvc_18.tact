struct ManyOptionalBools {
    b0: Bool?;
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
    b21: Bool?;
    b22: Bool?;
    b23: Bool?;
    b24: Bool?;
}

contract OptBoolBulk {
    f: ManyOptionalBools;
    init() {
        self.f = ManyOptionalBools{
            b0: null,
            b1: null,
            b2: null,
            b3: null,
            b4: null,
            b5: null,
            b6: null,
            b7: null,
            b8: null,
            b9: null,
            b10: null,
            b11: null,
            b12: null,
            b13: null,
            b14: null,
            b15: null,
            b16: null,
            b17: null,
            b18: null,
            b19: null,
            b20: null,
            b21: null,
            b22: null,
            b23: null,
            b24: null,
        };
    }
}