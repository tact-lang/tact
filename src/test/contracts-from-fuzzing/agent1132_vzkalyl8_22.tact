struct Tiny {
    bit: Bool;
    two: Int as uint2;
    four: Int as uint4;
}

contract SmallNumeric {
    tiny: Tiny = Tiny{bit: false, two: 3, four: 15};
}