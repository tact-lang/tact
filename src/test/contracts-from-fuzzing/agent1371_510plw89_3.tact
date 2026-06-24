struct InnerMost {
    a: Int?;
    b: Bool?;
}

struct Inner {
    im1: InnerMost?;
    im2: InnerMost?;
    flag: Bool;
}

struct Outer {
    inner1: Inner?;
    inner2: Inner?;
    description: String?;
}

contract OptDeepNested {
    info: Outer;

    init() {
        self.info = Outer{
            inner1: Inner{
                im1: InnerMost{a: null, b: true},
                im2: null,
                flag: false
            },
            inner2: null,
            description: null
        };
    }
}
