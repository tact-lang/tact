struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    s1opt: S1?;
    flag: Bool;
}

struct S3 {
    s2: S2;
    optS2: S2?;
    text: String;
}

contract LayeredStructs {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ a: 10, b: true },
                s1opt: null,
                flag: false,
            },
            optS2: null,
            text: "text",
        };
    }
}