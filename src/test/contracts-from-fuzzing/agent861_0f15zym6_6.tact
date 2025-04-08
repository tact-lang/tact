struct Deep1 { x: Int; }
struct Deep2 { inner: Deep1; }
struct Deep3 { inner: Deep2; }
struct Deep4 { inner: Deep3; }
struct Deep5 { inner: Deep4; }

contract DeepNest {
    data: Deep5;

    init() {
        self.data = Deep5{ inner: Deep4{ inner: Deep3{ inner: Deep2{ inner: Deep1{ x: 1 } } } } };
    }

    receive() {
        let _ = self.data;
    }
}