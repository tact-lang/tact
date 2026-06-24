struct Deep3 { val: Int; }
struct Deep2 { inner: Deep3; }
struct Deep1 { inner: Deep2; }

contract DeepNested {
    root: Deep1;

    init() {
        self.root = Deep1{ inner: Deep2{ inner: Deep3{ val: 42 } } };
    }
}