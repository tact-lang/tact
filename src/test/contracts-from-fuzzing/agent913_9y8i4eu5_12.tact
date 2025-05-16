// Nested deeply optional booleans and strings with initialized values

struct S1 { v: Bool?; }
struct S2 { s: S1?; }
struct S3 { t: S2?; }

contract TestContract {
    data: S3;
    init() {
        self.data = S3{
            t: S2{
                s: S1{
                    v: true
                }
            }
        };
    }
}