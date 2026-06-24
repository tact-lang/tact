struct InnerMost {
    value1: Int;
    value2: Bool;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle;
}

contract OptionalInsideNested {
    container: Outer;
    init() {
        self.container = Outer{
            mid: Middle{
                inner: null,
            },
        };
    }
}