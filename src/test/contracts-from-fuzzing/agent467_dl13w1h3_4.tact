// Test optional of nested struct
struct Inner {
    flag: Bool;
}

struct Outer {
    inner: Inner?;
}

contract OptStructField {
    val: Outer;

    init() {
        self.val = Outer{
            inner: null
        };
    }
}
