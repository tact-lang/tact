struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    x: S1;
    y: Int;
}

struct S3 {
    s2: S2;
    z: Bool?;
}

contract MultiStruct {
    s3: S3;

    init() {
        self.s3 = S3{
            s2: S2{
                x: S1{a:1, b:null},
                y:2
            },
            z: true
        };
    }
}