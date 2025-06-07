struct S1 {
    i: Int = -1;
    b: Bool = true;
}

struct S2 {
    s1: S1; 
    sbool: Bool?;
}

struct S3 {
    inner: S2;
    txt: String;
}

contract Test {
    val: S3;
    init() {
        self.val = S3{
            inner: S2{ s1: S1{}, sbool: null },
            txt: "test"
        };
    }
}