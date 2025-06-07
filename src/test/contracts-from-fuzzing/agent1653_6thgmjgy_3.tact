struct S1 {
    i: Int;
}

struct S2 {
    s1: S1;
    opt: Bool?;
    txt: String;
}

struct S3 {
    inner: S2;
    bigNum: Int;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            inner: S2{ s1: S1{i: 7}, opt: null, txt: "abc" },
            bigNum: 999
        };
    }
}