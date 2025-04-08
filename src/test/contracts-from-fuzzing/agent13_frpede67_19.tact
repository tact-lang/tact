// deeply nested structs combined with optional inner and outer
struct InnerMost { data: Int; }
struct Middle { inner: InnerMost?; }
struct Outer { middle: Middle?; }

contract TestContract {
    field: Outer?;
    init() {
        self.field = Outer { middle: null };
    }
}