struct InnerMost {
    z: Int?;
}

struct Inner {
    y: Int;
    inn: InnerMost;
}

struct Mid {
    inner: Inner;
    note: String;
}

contract DeeplyNested {
    all: Mid;

    init() {
        self.all = Mid{
            inner: Inner{
                y: 10,
                inn: InnerMost{z: null}
            },
            note: "deepest"
        };
    }
}