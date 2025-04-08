// deeply nested optional struct with mixed defaults
struct A { val: Int = 1; }
struct B { inner: A? = null; }
struct C { x: Int; b: B; }

contract DeepOptions {
    storage: C;

    init() {
        self.storage = C{
            x: 5,
            b: B{ inner: null },
        };
    }
}
