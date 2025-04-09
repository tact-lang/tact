struct Deep1 { x: Int }
struct Deep2 { inner: Deep1 }
struct Deep3 { inner: Deep2 }
struct Deep4 { inner: Deep3 }

contract Test {
    d: Deep4;

    init() {
        self.d = Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ x: 77 } } } };
    }
}
