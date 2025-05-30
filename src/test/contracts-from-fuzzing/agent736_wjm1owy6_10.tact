struct Mid {
    s: String;
    flag: Bool;
}

contract TestContract {
    s1: String = "hello";
    s2: String? = null;
    b1: Bool = false;
    b2: Bool? = null;
    i1: Int = 1;
    i2: Int? = null;
    mid: Mid = Mid{s:"hi", flag:true};

    init() {
        self.s1 = "hello";
        self.s2 = null;
        self.b1 = false;
        self.b2 = null;
        self.i1 = 1;
        self.i2 = null;
        self.mid = Mid{s:"hi", flag:true};
    }

    receive() {
        dump(self.mid.flag);
    }
}