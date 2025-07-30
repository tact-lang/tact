struct ManyBools {
    b1: Bool?;
    b2: Bool?;
    b3: Bool?;
    b4: Bool?;
    b5: Bool?;
    b6: Bool?;
    b7: Bool?;
    b8: Bool?;
    b9: Bool?;
    b10: Bool? = false;
}

contract LotsOfOptionals {
    m: ManyBools;

    init() {
        self.m = ManyBools{
            b1: true,
            b2: null,
            b3: false,
            b4: null,
            b5: true,
            b6: null,
            b7: false,
            b8: null,
            b9: true
        };
    }
}