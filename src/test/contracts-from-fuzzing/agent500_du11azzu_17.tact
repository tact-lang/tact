struct S1 { a: Int; b: Int; }
struct S2 { c: Int; d: Int; }
struct S3 { e: Int; f: Int; }
struct S4 { g: Int; h: Int; }

struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
    s4: S4;
}

contract MultipleNested {
    storage: Combo;
    init() {
        self.storage = Combo{
            s1: S1{a:1,b:2},
            s2: S2{c:3,d:4},
            s3: S3{e:5,f:6},
            s4: S4{g:7,h:8}
        };
    }
    receive() {}
}