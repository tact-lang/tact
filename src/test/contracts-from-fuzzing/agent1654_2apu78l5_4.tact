struct Deep1 { v: Int }
struct Deep2 { inner: Deep1 }
struct Deep3 { inner: Deep2 }
struct Deep4 { inner: Deep3 }

contract TestContract {
    deep: Deep4;
    init() {
        self.deep = Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ v: 42 }}}};
    }
}