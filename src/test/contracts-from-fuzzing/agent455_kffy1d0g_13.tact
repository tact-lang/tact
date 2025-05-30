struct S1 { v1: Int; }
struct S2 { v2: Int; }
struct S3 { v3: Int; }

struct Nesting {
  a: S1;
  b: S2;
  c: S3;
}

contract ManyStructs {
    s: Nesting;

    init() {
        self.s = Nesting{
            a: S1{v1: 1},
            b: S2{v2: 2},
            c: S3{v3: 3},
        };
    }
}