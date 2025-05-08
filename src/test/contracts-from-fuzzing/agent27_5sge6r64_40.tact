// Nested struct, some fields defaulted, some optional, some with serialization
struct Inner {
    a: Int as uint32;
    b: Bool?;
    c: String = "default";
}

struct Outer {
    inr: Inner?;
    d: Int as int64 = -1;
    e: Bool;
}

contract TestContract {
    val: Outer;
    init() {
        self.val = Outer{
            inr: null,
            e: true
        };
    }
}
