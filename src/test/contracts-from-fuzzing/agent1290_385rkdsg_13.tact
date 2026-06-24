struct S1 {
    s: String;
}

struct S2 {
    s1: S1;
    flag: Bool;
}

struct S3 {
    s2: S2;
    num: Int?;
}

struct S4 {
    s3: S3;
    text: String?;
}

contract TestContract {
    composite: S4;

    init() {
        self.composite = S4{
            s3: S3{
                s2: S2{ s1: S1{ s: "init" }, flag: false },
                num: null
            },
            text: null
        };
    }

    receive() {
        self.composite = S4{
            s3: S3{
                s2: S2{ s1: S1{ s: "change" }, flag: true },
                num: 777
            },
            text: "done"
        };
    }
}