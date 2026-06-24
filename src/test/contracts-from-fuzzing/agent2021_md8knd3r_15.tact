struct ManyOptionalBools {
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
}

contract OptionalBoolsTest {
    bools: ManyOptionalBools;

    init() {
        self.bools = ManyOptionalBools{
            b1: null,
            b2: true,
            b3: null,
            b4: false,
            b5: null,
            b6: null,
            b7: true,
            b8: false,
            b9: null,
            b10: true,
        };
    }
}
