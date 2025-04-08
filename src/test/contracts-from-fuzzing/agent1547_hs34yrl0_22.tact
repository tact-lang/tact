struct WithZeroes {
    zero1: Int as uint8;
    zero2: Int as uint4;
    zero3: Int as uint1;

    nonZero: Int;
}

contract EdgeSerialize {
    data: WithZeroes;
    init() {
        self.data = WithZeroes{
            zero1: 0,
            zero2: 0,
            zero3: 0,
            nonZero: 123
        };
    }
}