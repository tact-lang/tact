struct Perm {
    p1: Int;
    p2: Bool;
}

contract Test {
    perma: Perm;
    temp1: Int;
    temp2: Bool;
    init() {
        self.perma = Perm{ p1: 123, p2: true };
        self.temp1 = 456;
        self.temp2 = false;
    }
    receive() { let _ = self.temp1; }
}