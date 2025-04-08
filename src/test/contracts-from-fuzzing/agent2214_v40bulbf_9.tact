struct S1 { a: Int; }
struct S2 { b: S1; }
struct S3 { c: S2; }
struct S4 { d: S3; }
struct S5 { e: S4; }

contract FiveNests {
    nest: S5;

    init() {
        self.nest = S5{e: S4{d: S3{c: S2{b: S1{a:123}}}}};
    }
}