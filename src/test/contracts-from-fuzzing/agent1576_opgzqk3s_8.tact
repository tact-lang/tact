struct S1 {
    x: Int;
    y: String?;
}

struct S2 {
    s1a: S1;
    s1b: S1;
    z: Bool;
}

struct S3 {
    s2a: S2;
    s2b: S2;
    a: Int;
}

contract Recursive {
    s3: S3;

    init() {
        self.s3 = S3{
            s2a: S2{
                s1a: S1{x:1,y:null},
                s1b: S1{x:2,y:"hi"},
                z: true,
            },
            s2b: S2{
                s1a: S1{x:3,y:null},
                s1b: S1{x:4,y:null},
                z: false,
            },
            a: 5,
        };
    }
}