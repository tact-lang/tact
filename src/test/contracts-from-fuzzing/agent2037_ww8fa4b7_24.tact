// Nested optional Int
struct OptInt {
    v: Int?;
}

struct OptOptInt {
    inner: OptInt?;
}

contract OptionalWrapNested {
    w: OptOptInt;

    init() {
        self.w = OptOptInt{
            inner: OptInt{
                v: null
            }
        };
    }
}
