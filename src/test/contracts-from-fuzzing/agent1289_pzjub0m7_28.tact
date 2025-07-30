struct S3 { val: Int; }
struct S2 { inner: S3; }
struct S1 { deep: S2; flag: Bool; }

contract DeeplyNestedValueInit {
    x: S1;

    init() {
        self.x = S1{
            deep: S2{
                inner: S3{
                    val: 777
                }
            },
            flag: true
        };
    }
}