struct Nested {
    inner: Inner;
}

struct Inner {
    val: Int;
}

contract OverwriteInit {
    s: Nested = Nested{ inner: Inner{ val: 5 } };

    init() {
        self.s = Nested{ inner: Inner{ val: 10 } };
    }
}