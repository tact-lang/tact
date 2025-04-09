struct S0 { a: Int; }
struct S1 { a: Int; b: S0; }
struct S2 { a: Int; b: S1;}

contract WideNested {
    s: S2;
    init() {
        self.s = S2{
            a:0, b: S1{ a:1, b:S0{a:2} }
        };
    }
}