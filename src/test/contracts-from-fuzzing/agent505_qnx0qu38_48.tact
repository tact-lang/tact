struct S0 {
    a: Int as uint4;
    b: Bool;
    c: String;
    d: Int?;
}

struct S1 { inner: S0; }
struct S2 { inner: S1; }
struct S3 { inner: S2; }
struct S4 { inner: S3; }

contract DeepSerialization {
    deep: S4 = S4{
        inner: S3{
            inner: S2{
                inner: S1{
                    inner: S0{
                        a: 7,
                        b: true,
                        c: "str",
                        d: null
                    }
                }
            }
        }
    };

    init() {
        self.deep = self.deep;
    }

    receive() {
        self.deep = self.deep;
    }
}