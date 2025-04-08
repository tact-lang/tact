struct RecA {
    b: RecB;
}

struct RecB {
    c: RecC;
}

struct RecC {
    msg: String;
}

contract MultiRec {
    r: RecA;
    
    init() {
        self.r = RecA{ b: RecB{ c: RecC{ msg: "deep" } } };
    }
}
