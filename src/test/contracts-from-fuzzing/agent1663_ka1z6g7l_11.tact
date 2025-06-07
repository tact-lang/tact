struct ManyBool {
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    b6: Bool;
    b7: Bool;
    b8: Bool;
}

contract LotsOfBools {
    data: ManyBool;

    init() {
        self.data = ManyBool{
            b1: true,
            b2: false,
            b3: true,
            b4: false,
            b5: true,
            b6: false,
            b7: true,
            b8: false,
        };
    }
}