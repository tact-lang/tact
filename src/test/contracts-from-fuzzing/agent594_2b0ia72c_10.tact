struct InnerBits {
    b: Bool;
}

struct BitsStruct {
    small: Int as uint8;
    nested: InnerBits;
}

contract Test10 {
    bs: BitsStruct;

    init() {
        self.bs = BitsStruct{
            small: 7,
            nested: InnerBits{b: true},
        };
    }

    receive() {}
}