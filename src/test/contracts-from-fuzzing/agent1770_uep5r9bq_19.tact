struct S1 {
    a: Int?;
}

struct S2 {
    inner: S1;
    flag: Bool;
}

struct S3 {
    data: S2?;
    s: String;
}

contract OptionalsDeep {
    val: S3;

    init() {
        self.val = S3{ data: null, s: "ok" };
    }
}