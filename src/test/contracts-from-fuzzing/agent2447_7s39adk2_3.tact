struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract NestedFields {
    s: Outer = Outer{ middle: Middle{ inner: Inner{ val: 1 } } };
}