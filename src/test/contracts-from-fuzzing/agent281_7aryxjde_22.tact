struct S1 { a: Int; }
struct S2 { b: Int; c: S1; }
struct S3 { d: Int; e: S2; }
struct S4 { f: Int; g: S3; }
struct S5 { h: Int; i: S4; }

contract Tangle {
    tangled: S5;

    init() {
        self.tangled = S5{
            h: 50,
            i: S4{
                f: 40,
                g: S3{
                    d: 30,
                    e: S2{ b: 20, c: S1{ a: 10 } }
                }
            }
        };
    }
}