struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1; 
    optInt: Int?;
    str: String;
}

struct S3 {
    s2: S2;
    flag: Bool;
    count: Int;
    optStr: String?;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ a:123, b:true },
                optInt: null,
                str: "hi"
            },
            flag: false,
            count: -42,
            optStr: null
        };
    }
}