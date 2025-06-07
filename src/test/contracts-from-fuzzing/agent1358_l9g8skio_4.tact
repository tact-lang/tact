struct C { value: Int; flag: Bool; }
struct B { nested: C; }
struct A { inner: B; }

contract DeepNest {
    store: A;

    init() {
        self.store = A {
            inner: B {
                nested: C {
                    value: 123,
                    flag: true,
                },
            },
        };
    }
}