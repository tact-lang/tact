struct InnerMost {
    a: Int;
    b: String?;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract OptOptOpt {
    store: Outer?;

    init() {
        self.store = Outer{
            mid: Middle{
                inner: InnerMost{
                    a: 321,
                    b: "hi"
                }
            }
        };
    }
}