struct S_A { a:Int; }
struct S_B { b:Int; }
struct S_C { c:Int; }

struct Combo {
    first: S_A;
    second: S_B;
    third: S_C;
}

contract StructsComposition {
    combined: Combo;
    init() {
        self.combined = Combo{first:S_A{a:1}, second:S_B{b:2}, third:S_C{c:3}};
    }
}