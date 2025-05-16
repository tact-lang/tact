struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { c: String; }
struct S4 { d: Address; }
struct S5 { e: Cell; }

struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
    s5: S5;
}

contract Aggregate {
    nested: Combo;
    init() {
        self.nested = Combo{
            s1: S1{a: 1},
            s2: S2{b: true},
            s3: S3{c: "hi"},
            s4: S4{d: myAddress()},
            s5: S5{e: emptyCell()}
        };
    }
}