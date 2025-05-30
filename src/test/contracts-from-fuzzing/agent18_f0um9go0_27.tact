struct S1 { a: Int; }
struct S2 { b: Int; }
struct Combo {
    s1: S1;
    s2: S2;
    x: Bool;
}

contract ComboTest {
    data: Combo;
    init() {
        self.data = Combo{
            s1:S1{a:1},
            s2:S2{b:2},
            x:true
        };
    }
}
