struct Sub {
    n: Int;
}

struct Super {
    f: Int;
    s: Sub;
}

contract EmbeddedStructs {
    inner: Sub;
    outer: Super;

    init() {
        self.inner = Sub{n: 5};
        self.outer = Super{f: 10, s: Sub{n: 6}};
    }
}