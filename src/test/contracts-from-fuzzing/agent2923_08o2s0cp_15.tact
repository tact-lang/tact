struct S1 { a: Int }
struct S2 { s1: S1; val: Int }
struct S3 { s2: S2; flag: Bool }

contract Deep3Nest {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{a: 123},
                val: 456
            },
            flag: true
        };
    }
}