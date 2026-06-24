struct S1 { x: Int }
struct S2 { y: Bool }
struct Combo {
    s1: S1;
    s2: S2;
}

contract ComboTest {
    data: Combo;

    init() {
        self.data = Combo{
            s1: S1{x:1},
            s2: S2{y:true},
        };
    }
}