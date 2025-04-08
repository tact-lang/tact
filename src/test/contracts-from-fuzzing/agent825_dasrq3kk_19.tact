struct S1 { a: Int }
struct S2 { b: Bool }
struct Combo { s1: S1; s2: S2; c: Int }

contract Test {
    combo: Combo;

    init() {
        self.combo = Combo{
            s1: S1{a:10},
            s2: S2{b:true},
            c:20
        };
    }
}