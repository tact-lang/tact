struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner;
}

struct Outer {
    middle: Middle;
}

contract TestContract {
    nest: Outer = Outer{ middle: Middle{ inner: Inner{ val: 123 } } };
}