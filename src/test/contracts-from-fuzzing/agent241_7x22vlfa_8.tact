struct S1 { f: Int; }
struct S2 { inner: S1; }
struct S3 { inner: S2; }

contract DeepChain {
    data: S3;

    init() {
        self.data = S3{
            inner: S2{
                inner: S1{
                    f: 123
                }
            }
        };
    }
}