struct Innermost {
    v: Int?;
}

struct Middle {
    inner: Innermost?;
}

struct Outer {
    middle: Middle?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{ middle: null };
    }
}