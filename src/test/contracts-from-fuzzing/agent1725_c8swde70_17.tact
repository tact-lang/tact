struct SZero { x: Int as uint4; }
struct SOne { x: Int as uint8; }
struct STwo { x: Int as uint16; }
struct SThree { x: Int as uint32; }
struct SFour { x: Int as uint64; }
struct SFive { x: Int as uint128; }

contract SerialSizes {
    s0: SZero;
    s1: SOne;
    s2: STwo;
    s3: SThree;
    s4: SFour;
    s5: SFive;

    init() {
        self.s0 = SZero{ x: 1 };
        self.s1 = SOne{ x: 2 };
        self.s2 = STwo{ x: 3 };
        self.s3 = SThree{ x: 4 };
        self.s4 = SFour{ x: 5 };
        self.s5 = SFive{ x: 6 };
    }
}