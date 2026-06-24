struct InnerMost {
    val: Int;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract ManyNestedOptionalStructs {
    data: Outer;

    init() {
        self.data = Outer{
            mid: null,
        };
    }
}