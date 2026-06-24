struct Innermost {
    x: Int;
    y: Int?;
}

struct Inner {
    s: String?;
    nested: Innermost;
    f: Bool;
}

struct Wrapper {
    wrapper_s: String;
    inner: Inner;
    some_flag: Bool?;
}

contract TestContract {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            wrapper_s: "wrap",
            inner: Inner{
                s: null,
                nested: Innermost{
                    x: 1,
                    y: null,
                },
                f: true,
            },
            some_flag: null,
        };
    }
}
