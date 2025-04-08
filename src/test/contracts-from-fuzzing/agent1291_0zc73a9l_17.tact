struct Tiny {
    a: Int as uint4;
    b: Int as uint4;
    c: Int as uint4;
}

contract Test {
    s: Tiny;

    init() {
        self.s = Tiny{a:1,b:2,c:3};
    }
}