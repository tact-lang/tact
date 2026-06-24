struct StructA {
    val: Int = 1;
    txt: String = "one";
}

contract ArrayLike {
    s0: StructA;
    s1: StructA;
    s2: StructA;
    s3: StructA;
    s4: StructA;

    init() {
        self.s0 = StructA{ val: 0, txt: "0" };
        self.s1 = StructA{ val: 1, txt: "1" };
        self.s2 = StructA{ val: 2, txt: "2" };
        self.s3 = StructA{ val: 3, txt: "3" };
        self.s4 = StructA{ val: 4, txt: "4" };
    }
}