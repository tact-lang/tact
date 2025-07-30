// test struct default null optional nested inside optional struct field
struct S2 {
    z: Int;
}

struct S1 {
    maybeInner: S2?;
}

contract TestContract {
    val: S1?;
    init() {
        self.val = null;
    }
}
