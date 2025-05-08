struct Tiny {
    a: Int as uint1;
    b: Int as int3;
    c: Bool;
}

contract Test {
    t: Tiny;

    init() {
        self.t = Tiny{ a:1, b:-4, c:true };
    }

    receive() {}
}