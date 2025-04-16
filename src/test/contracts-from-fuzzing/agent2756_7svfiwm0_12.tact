struct InnerMost { a: Int; }
struct Inner {
    nested: InnerMost?;
}
struct Outer {
    inner: Inner?;
}

contract DeepNullable {
    data: Outer;

    init() {
        self.data = Outer{ inner: null };
    }
}