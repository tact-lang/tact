struct InnerS {
    val: Int;
}

contract ManyInnerStructs {
    i1: InnerS;
    i2: InnerS;
    i3: InnerS;
    i4: InnerS;
    i5: InnerS;

    init() {
        self.i1 = InnerS{ val: 1 };
        self.i2 = InnerS{ val: 2 };
        self.i3 = InnerS{ val: 3 };
        self.i4 = InnerS{ val: 4 };
        self.i5 = InnerS{ val: 5 };
    }
}