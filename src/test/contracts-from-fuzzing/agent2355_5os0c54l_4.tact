struct InnerMost {
    x: Int;
    y: Bool;
    s: String;
}

struct Inner {
    im: InnerMost;
    opt: InnerMost?;
}

contract WithDeepOptional {
    d: Inner? = null;

    init() {
        self.d = Inner{
            im: InnerMost{ x: 1, y: true, s: "hi" },
            opt: null
        };
    }
}