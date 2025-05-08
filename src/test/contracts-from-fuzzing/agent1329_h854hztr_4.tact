struct Deep1 { f: Int; }
struct Deep2 { inner: Deep1; }
struct Deep3 { inner: Deep2; }
struct Deep4 { inner: Deep3; }

contract NestedDeep {
    data: Deep4;

    init() {
        self.data = Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ f: 42 } } } };
    }
}