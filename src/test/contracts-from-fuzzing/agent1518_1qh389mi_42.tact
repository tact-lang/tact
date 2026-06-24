struct InnerMost {
    val: Int;
}

struct Wrap1 {
    inner: InnerMost;
}

struct Wrap2 {
    inner: Wrap1;
}

struct Wrap3 {
    inner: Wrap2;
}

contract ManyWraps {
    val: Wrap3;

    init() {
        self.val = Wrap3 {
            inner: Wrap2 { inner: Wrap1 { inner: InnerMost { val: 42 } } }
        };
    }
}