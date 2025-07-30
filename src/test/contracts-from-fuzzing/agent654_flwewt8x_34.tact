struct S1 {
    a: Int;
    b: Bool;
    c: String;
}
struct S2 {
    d: Int?;
    e: Bool?;
    f: String?;
}
contract TestContract {
    s1: S1;
    s2: S2;
    init() {
        self.s1 = S1{ a:1, b:true, c:"x" };
        self.s2 = S2{ d:null, e:null, f:null };
    }
}