// Deeply nested optional fields inside struct
struct InnerMost {
    val: Int?;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    middle: Mid?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            middle: null
        };
    }
}