struct InnerMost { a: Int; }
struct Inner { im: InnerMost; }
struct Outer { inner: Inner; }

contract UltraDeep {
    field: Outer;
    init() {
        self.field = Outer{ inner: Inner{ im: InnerMost{ a: 1 } } };
    }
}