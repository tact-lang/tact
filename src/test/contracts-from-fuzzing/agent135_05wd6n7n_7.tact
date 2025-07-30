struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    c: S1;
    d: String;
}

struct S3 {
    e: S2;
    f: Bool;
}

struct S4 {
    g: S3;
    h: Int?;
}

contract MultiLayer {
    data: S4;

    init() {
        self.data = S4{
            g: S3{
                e: S2{
                    c: S1{
                        a: 5,
                        b: "hi"
                    },
                    d: "mid"
                },
                f: false
            },
            h: null
        };
    }
}
