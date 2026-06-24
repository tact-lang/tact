struct S1 {
    a: Int;
}
struct S2 {
    b: Bool;
}
struct S3 {
    c: String;
}
struct S4 {
    d: Address;
}
struct S5 {
    e: Cell;
}

contract Chain {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;

    init() {
        self.s1 = S1{a:123};
        self.s2 = S2{b:true};
        self.s3 = S3{c:"hi"};
        self.s4 = S4{d:myAddress()};
        self.s5 = S5{e:emptyCell()};
    }
}