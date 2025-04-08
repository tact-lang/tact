struct InnerMost {
    deepValue: Int;
}

struct Inner {
    innerValue: Int?;
    nested: InnerMost;
}

struct Complex {
    val1: Int;
    optionalInner: Inner?;
}

contract StorageComplexTest {
    data: Complex;

    init() {
        self.data = Complex{
            val1: 42,
            optionalInner: null,
        };
    }
}