struct S1 { a: Int; }
struct S2 { b: Int; c: S1; }
struct S3 { d: Int; e: S2; }
struct S4 { f: Int; g: S3; }
struct S5 { h: Int; i: S4; }

contract Test {
    v: S5?;

    init() {
        self.v = S5{
            h: 0,
            i: S4{
                f: 1,
                g: S3{
                    d: 2,
                    e: S2{
                        b: 3,
                        c: S1{ a: 4 }
                    }
                }
            }
        };
    }

    receive() { let _ = self.v; }
}