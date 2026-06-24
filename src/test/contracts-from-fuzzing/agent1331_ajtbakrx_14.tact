struct Innermost {
    x: Int;
}

struct Middle {
    inner: Innermost;
}

struct Top {
    middle: Middle;
}

contract InitDeepNested {
    val: Top;

    init() {
        self.val = Top{ middle: Middle{ inner: Innermost{ x: 444 } } };
    }
}