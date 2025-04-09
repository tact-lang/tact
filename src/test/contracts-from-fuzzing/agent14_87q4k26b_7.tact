struct BoolNest {
    b1: Bool;
    b2: Bool?;
    b3: Bool;
    b4: Bool?;
}

contract ContractBoolNest {
    s: BoolNest;

    init() {
        self.s = BoolNest{
            b1: true,
            b2: null,
            b3: false,
            b4: true,
        };
    }
}