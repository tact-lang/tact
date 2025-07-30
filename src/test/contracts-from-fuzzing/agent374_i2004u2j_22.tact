// Chain of structs each with optionals and defaults
struct DeepDefaults {
    foo: Int? = null;
    bar: Bool = true;
}

struct Compose {
    inner: DeepDefaults;
    baz: String = "abc";
}

contract TestContract {
    cmp: Compose;

    init() {
        self.cmp = Compose{inner: DeepDefaults{}};
    }

    receive() {
        if (self.cmp.inner.foo != null) {
            let _ = self.cmp.inner.foo!!;
        }
    }
}