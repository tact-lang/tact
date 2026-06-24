struct Inner {
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
}

struct Mid {
    inner: Inner;
    opt: Int?;
    flag: Bool = true;
}

contract NestedDefaults {
    data: Mid;

    init() {
        self.data = Mid{
            inner: Inner{},
            opt: null,
            flag: true,
        };
    }
    receive() {}
}