// Struct with optional that has optional inside
struct Inner {
    val: Int?;
}

struct Outer {
    field: Inner?;
}

contract OptOptInner {
    s: Outer;
    init() {
        self.s = Outer { field: null };
    }
}
