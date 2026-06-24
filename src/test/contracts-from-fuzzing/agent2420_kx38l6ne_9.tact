struct Packed {
    small1: Int as uint4;
    small2: Int as uint5;
    small3: Int as uint8;
    flag1: Bool;
    flag2: Bool;
    small4: Int as uint3;
}

contract BitPacking {
    p: Packed;

    init() {
        self.p = Packed{
            small1: 2,
            small2: 3,
            small3: 8,
            flag1: true,
            flag2: false,
            small4: 7,
        };
    }
}