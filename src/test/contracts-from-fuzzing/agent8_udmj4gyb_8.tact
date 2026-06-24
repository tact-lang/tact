struct InnerMost {
    val: Bool;
}

struct MidLevel {
    inner: InnerMost?;
    x: Int;
}

struct Outer {
    mid: MidLevel?;
    s: String?;
}

contract TestContract {
    field: Outer?;

    init() {
        self.field = Outer{
            mid: null,
            s: null
        };
    }
}
