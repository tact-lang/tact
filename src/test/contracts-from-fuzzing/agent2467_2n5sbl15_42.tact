struct InnerMost { a: Int; }
struct Inner { im: InnerMost?; }
struct Outer { inner: Inner?; }

contract UltraDeepOptional {
    field: Outer?;
    init() {
        self.field = null;
    }
}