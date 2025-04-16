struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }
struct S4 { d: Cell }
struct S5 { e: Slice }
struct S6 { f: Address }

contract TestContract {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
    s6: S6;
    i: Int;
    b: Bool;
    str: String;
    cl: Cell;
    sl: Slice;
    addr: Address;

    init() {
        self.s1 = S1{a:1};
        self.s2 = S2{b:true};
        self.s3 = S3{c:"hi"};
        self.s4 = S4{d:emptyCell()};
        self.s5 = S5{e:emptyCell().asSlice()};
        self.s6 = S6{f:myAddress()};
        self.i = 42; self.b = false; self.str = "bye";
        self.cl = emptyCell();
        self.sl = emptyCell().asSlice();
        self.addr = myAddress();
    }
}