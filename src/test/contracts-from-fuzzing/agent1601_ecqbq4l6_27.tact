struct Wrap {
    s: String;
    i: Int;
    flag: Bool;
}

contract Complex {
    w1: Wrap;
    w2: Wrap;

    init() {
        self.w1 = Wrap{ s:"x", i:1, flag:true };
        self.w2 = Wrap{ s:"y", i:2, flag:false };
    }
}