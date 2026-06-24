struct Tiny {
    a: Int as int1;
    b: Int as uint1;
    c: Int as int1;
    d: Int as uint1;
}

contract Test {
    packed: Tiny;
    init() {
        self.packed = Tiny{a:0,b:1,c:1,d:0};
    }
}