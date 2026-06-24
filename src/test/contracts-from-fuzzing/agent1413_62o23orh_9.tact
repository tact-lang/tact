struct BoolLayer {
    b1: Bool;
    b2: Bool?;
    b3: Bool?;
}

contract BoolFields {
    flags: BoolLayer;
    init() {
        self.flags = BoolLayer{
            b1: true,
            b2: false,
            b3: null
        };
    }
}