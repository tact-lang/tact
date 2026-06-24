// optional at top level struct with optional inside nested struct
struct Inner {
    a: Int?;
}

struct Outer {
    inner: Inner?;
}

contract TopOpt {
    val: Outer?;

    init() {
        self.val = null;
    }
}
