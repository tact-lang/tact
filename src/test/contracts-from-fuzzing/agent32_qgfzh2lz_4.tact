struct InnerMost { x: Int }
struct Middle { inner: InnerMost? }
struct Outer { middle: Middle? }

contract OptionalDeep {
    field: Outer?;

    init() {
        self.field = null;
    }
}
