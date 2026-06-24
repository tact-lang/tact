struct Valid {
    n: Int;
    f: Bool;
}

contract Contr {
    s: Valid;
    n: Int;

    init() {
        self.s = Valid{ n:1, f:true };
        self.n = 5;
    }
}