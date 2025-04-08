struct Inner {
    nestedOptAddr: Address?;
}

struct Complex {
    number: Int;
    optBool: Bool?;
    inner: Inner;
}

contract StorageTest {
    data: Complex;

    init() {
        self.data = Complex{
            number: 0,
            optBool: null,
            inner: Inner{ nestedOptAddr: null }
        };
    }
}