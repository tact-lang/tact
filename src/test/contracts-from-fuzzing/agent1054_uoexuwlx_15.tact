struct S1 {
    x: Int as int64;
    y: Bool;
}

struct S2 {
    a: Int as uint4;
    b: String;
    c: Int?;
}

contract TestContract {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ x:123, y:true };
        self.s2 = S2{ a:5, b:"hi", c:null };
    }
}