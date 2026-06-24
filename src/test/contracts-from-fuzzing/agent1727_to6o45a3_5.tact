struct Deep1 { val: Int = 1; }
struct Deep2 { inner: Deep1 = Deep1{}; }
struct Deep3 { inner: Deep2 = Deep2{}; }
struct Deep4 { inner: Deep3 = Deep3{}; }
struct Deep5 { inner: Deep4 = Deep4{}; }

contract NestedDepths {
    data: Deep5 = Deep5{};

    receive() {
        self.data = Deep5{};
    }
}