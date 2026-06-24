struct BoolsPack {
    flagA: Bool;
    flagB: Bool;
    flagC: Bool?;
    flagD: Bool;
    flagE: Bool?;
    flagF: Bool;
}

contract BoolPacking {
    flags: BoolsPack;

    init() {
        self.flags = BoolsPack{
            flagA: true,
            flagB: false,
            flagC: null,
            flagD: true,
            flagE: null,
            flagF: false,
        };
    }
}