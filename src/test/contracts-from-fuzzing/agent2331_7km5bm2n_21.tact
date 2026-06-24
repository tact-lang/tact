struct StrNest1 { a: Int; }
struct StrNest2 { a: StrNest1; }
struct StrNest3 { a: StrNest2; }
struct StrNest4 { a: StrNest3; }

contract Test {
    v: StrNest4;
    init() {
        self.v = StrNest4{a: StrNest3{a: StrNest2{a: StrNest1{a: 1}}}};
    }
}