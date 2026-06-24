struct Deep3 { f: Int; }
struct Deep2 { inner: Deep3; }
struct Deep1 { inner: Deep2; }

contract DeepNestTest {
    store: Deep1;

    init() {
        self.store = Deep1{ inner: Deep2{ inner: Deep3{ f: 7 } } };
    }
}