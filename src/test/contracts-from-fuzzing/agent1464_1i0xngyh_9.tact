struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

struct S2 {
    d: Int;
    e: Address;
    f: Cell;
}

contract ManyStructs {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ a:1, b:true, c:"hi"};
        self.s2 = S2{ d:2, e:myAddress(), f:emptyCell()};
    }
}
