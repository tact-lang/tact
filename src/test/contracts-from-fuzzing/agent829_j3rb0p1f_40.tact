struct SInt {
    x: Int;
}

contract DefaultStructField {
    s: SInt = SInt{ x: 123 };

    init() {
        self.s = SInt{ x: 456 };
    }
}