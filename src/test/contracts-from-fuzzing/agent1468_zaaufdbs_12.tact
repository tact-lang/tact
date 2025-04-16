struct Inner {
    txt: String = "hello";
    flag: Bool = true;
}

struct Container {
    info: Inner;
    comment: String?;
}

struct Top {
    c1: Container;
    c2: Container;
    extra: Bool?;
}

contract TestStructDefaults {
    val: Top;

    init() {
        self.val = Top{
            c1: Container{ info: Inner{}, comment: null },
            c2: Container{ info: Inner{}, comment: null },
            extra: null,
        };
    }
}