struct DeepNested { inner: Inner; extra: Int }

struct Inner { a: Int; b: Int }

contract TestDeepNested {
    value: DeepNested;

    init() {
        self.value = DeepNested{
            inner: Inner{ a: 10, b: 20 },
            extra: 99
        };
    }
}