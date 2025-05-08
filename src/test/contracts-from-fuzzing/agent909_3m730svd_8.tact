struct S4 { val: Int?; }
struct S3 { inner: S4; }
struct S2 { inner: S3; optVal: Bool?; }
struct S1 { inner: S2; flag: Bool; }

contract DeepNest {
    root: S1;

    init() {
        self.root = S1{
            inner: S2{
                inner: S3{
                    inner: S4{
                        val: 123,
                    },
                },
                optVal: null,
            },
            flag: true,
        };
    }
}