struct Nested { foo: Int; bar: Bool; }
struct Wrapper { inner: Nested; val: Int; }

contract DeepNest {
    stored: Wrapper;

    init() {
        self.stored = Wrapper{
            inner: Nested{ foo: 10, bar: false },
            val: 20
        };
    }
}