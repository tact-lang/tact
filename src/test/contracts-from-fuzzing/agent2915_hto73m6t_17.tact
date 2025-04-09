struct S4 { d: Int; }
struct S3 { c: S4; }
struct S2 { b: S3?; }
struct S1 { a: S2; }

contract TestContract {
    deep: S1;

    init() {
        self.deep = S1{
            a: S2{
                b: S3{
                    c: S4{ d: 99 }
                }
            }
        };
    }
}
