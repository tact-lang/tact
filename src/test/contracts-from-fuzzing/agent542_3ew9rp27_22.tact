struct DeepDefaults {
    inner: Inner;
}

struct Inner {
    foo: Int = 1;
    bar: Bool = true;
}

contract TestContract {
    stuff: DeepDefaults;

    init() {
        self.stuff = DeepDefaults{
            inner: Inner{}
        };
    }
}