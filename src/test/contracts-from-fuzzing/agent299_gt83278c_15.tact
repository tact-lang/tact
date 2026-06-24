struct Inner {
    s1: String = "default";
    s2: String?;
    s3: String? = "value";
}

struct Outer {
    inner: Inner;
    note: String?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                s1: "xxx",
                s2: null,
                s3: "yyy"
            },
            note: "note"
        };
    }
}