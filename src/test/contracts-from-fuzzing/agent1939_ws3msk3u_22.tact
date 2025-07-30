struct Numbers {
    big: Int;
    small: Int as uint8;
    tiny: Int as uint4;
}

contract NumberVariants {
    data: Numbers;
    init() {
        self.data = Numbers{ big: 1000, small: 200, tiny: 8 };
    }
}