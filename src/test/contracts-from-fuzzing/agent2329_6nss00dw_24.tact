struct A1 { a: Int; }
struct A2 { a: Int; }
struct A3 { a: Int; }

struct Combo {
    one: A1;
    two: A2;
    three: A3;
}

contract ComboTest {
    cmb: Combo;

    init() {
        self.cmb = Combo{
            one: A1{a:1},
            two: A2{a:2},
            three: A3{a:3}
        };
    }
}
