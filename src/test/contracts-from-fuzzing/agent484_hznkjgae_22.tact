struct S1 { a: Int; }
struct S2 { b: Int; }
struct Combo1 { s1: S1; s2: S2 }

struct Combo2 {
    first: Combo1;
    second: Combo1?;
    third: Combo1?;
}

contract TestContract {
    c: Combo2;

    init() {
        self.c = Combo2{
            first: Combo1{ s1: S1{a:1}, s2:S2{b:2} },
            second: null,
            third: null,
        };
    }
}