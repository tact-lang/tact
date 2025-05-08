struct Opts {
    n: Int?;
    b: Bool?;
    s: String?;
}

struct Wraps {
    inner: Opts;
    flag: Bool;
}

contract OptionalNested {
    wrapper: Wraps;

    init() {
        self.wrapper = Wraps{
            inner: Opts{ n: null, b: null, s: null },
            flag: false
        };
    }
}