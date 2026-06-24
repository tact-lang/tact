struct S1 { x: Int }
struct S2 { y: S1 }
struct S3 { z: S2 }
struct S4 { w: S3 }
struct S5 { v: S4 }

contract Test {
    deeply: S5;

    init() {
        self.deeply = S5{
            v: S4{
                w: S3{
                    z: S2{
                        y: S1{ x: 123 }
                    }
                }
            }
        };
    }
}