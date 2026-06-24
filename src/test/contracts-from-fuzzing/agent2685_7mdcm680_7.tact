struct S1 {
    a: Int = 5;
    b: Bool?;
}

struct S2 {
    inner: S1;
    str: String;
}

struct S3 {
    nest: S2;
    opt: Int?;
}

contract Composed {
    data: S3 = S3{
        nest: S2{
            inner: S1{ a: 5, b: null },
            str: "test"
        },
        opt: null
    };
}
