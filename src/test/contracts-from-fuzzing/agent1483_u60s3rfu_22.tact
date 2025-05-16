struct BoolSerializer {
    b1: Bool;
    b2: Bool;
    b3: Bool;
}

contract BoolBitsPacked {
    packed: BoolSerializer;

    init() {
        self.packed = BoolSerializer{
            b1: true,
            b2: false,
            b3: true,
        };
    }
}