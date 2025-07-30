struct Mini { x: Int; }

contract ArrayOfStructs {
    s1: Mini;
    s2: Mini;
    s3: Mini;

    init() {
        self.s1 = Mini{ x: 1 };
        self.s2 = Mini{ x: 2 };
        self.s3 = Mini{ x: 3 };
    }
}
