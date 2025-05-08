struct BoolPack {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
}

contract Test13 {
    flags: BoolPack;

    init() {
        self.flags = BoolPack{
            b1: false,
            b2: true,
            b3: false,
            b4: true,
            b5: false,
        };
    }
}