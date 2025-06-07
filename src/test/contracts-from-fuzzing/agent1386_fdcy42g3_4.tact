struct Deep1 { val: Int; }
struct Deep2 { inner: Deep1; }
struct Deep3 { inner: Deep2; }
struct Deep4 { inner: Deep3; }

contract VeryDeep {
    storage: Deep4;
    init() {
        self.storage = Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ val: 123 } } } };
    }
}