struct S1 { f: Int }
struct S2 { next: S1? }
struct S3 { next: S2? }
struct S4 { next: S3? }
struct S5 { next: S4? }

contract TestContract {
    root: S5;
    init() {
        self.root = S5{
            next: S4{
                next: S3{
                    next: null
                }
            }
        };
    }
}