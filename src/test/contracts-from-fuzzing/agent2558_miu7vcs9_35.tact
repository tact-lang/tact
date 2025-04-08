struct S1 {
    i: Int;
    s: String;
}

struct S2 {
    s1: S1;
    b: Bool;
}

struct S3 {
    s2: S2;
    x: Int?;
}

contract FinalBig {
    y: S3;

    init() {
        self.y = S3{
            s2: S2{
                s1: S1{
                    i: 5,
                    s: "hey"
                },
                b: false
            },
            x: null
        };
    }
}