struct S1 { inner: Int?; }
struct S2 { inner: S1?; }
struct S3 { inner: S2?; }
struct S4 { inner: S3?; }

contract CrazyDeepOpt {
    nest: S4;

    init() {
        self.nest = S4{inner: null};
    }

    receive() {
        self.nest.inner = S3{
            inner: S2{
                inner: S1{
                    inner: 42
                }
            }
        };
    }
}