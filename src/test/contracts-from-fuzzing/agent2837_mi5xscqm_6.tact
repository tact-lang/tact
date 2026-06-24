struct InnerMost {
    x: Int;
}

struct MiddleOptional {
    nested: InnerMost?;
}

struct Outer {
    mid: MiddleOptional;
}

contract TestOptionalDeep {
    val: Outer;
    init() {
        self.val = Outer{
            mid: MiddleOptional{ nested: null }
        };
    }
}