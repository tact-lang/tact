struct SS {
    a: Int;
    b: String;
}

contract UseSS {
    s1: SS;
    s2: SS?;
    init() {
        self.s1 = SS{a:1,b:"x"};
        self.s2 = null;
    }
}