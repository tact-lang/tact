struct NestedDeepStruct {
    s1: S1;
}

struct S1 {
    s2: S2;
    x: Int;
}

struct S2 {
    s3: S3;
}

struct S3 {
    y: Bool?;
}

contract TestContract {
    data: NestedDeepStruct;

    init() {
        self.data = NestedDeepStruct{
            s1: S1{
                x: 123,
                s2: S2{
                    s3: S3{
                        y: null,
                    },
                },
            },
        };
    }
}