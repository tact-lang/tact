// deeply nested optional inside nested struct
struct InnerInner {
    opt: Int?;
}

struct Inner {
    nested: InnerInner?;
}

struct Outer {
    inner: Inner?;
}

contract DeepNullTest {
    data: Outer;
    init() {
        self.data = Outer{ inner: null };
    }
}