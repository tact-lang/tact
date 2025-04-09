struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: S1;
    d: Int?;
}

struct S3 {
    e: S2;
    f: S1;
}

contract CrossStruct {
    data: S3;

    init() {
        self.data = S3{
            e: S2{
                c: S1{ a:1, b:true },
                d: null
            },
            f: S1{ a:2, b:false }
        };
    }
}