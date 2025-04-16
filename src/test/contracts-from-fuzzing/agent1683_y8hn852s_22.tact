struct Inner {
    bar: Bool;
}

struct Middle {
    inner: Inner?;
}

struct Outer {
    middle: Middle?;
}

contract OptionalCascade {
    val: Outer;

    init() {
        self.val = Outer{ middle: null };
    }

    receive() {
        self.val = Outer{ middle: Middle{ inner: Inner{ bar: true } } };
    }
}