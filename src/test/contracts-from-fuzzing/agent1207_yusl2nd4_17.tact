struct BoolVars {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
}

contract LotsOfBools {
    flags: BoolVars;

    init() {
        self.flags = BoolVars{
            b1: true,
            b2: false,
            b3: true,
            b4: false,
        };
    }
}