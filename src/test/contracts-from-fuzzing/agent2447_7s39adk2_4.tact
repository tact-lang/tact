struct Inner {
    val: Int;
}

struct Middle {
    inner: Inner?; // optional
}

struct Outer {
    middle: Middle;
}

contract NestedOptionals {
    s: Outer = Outer{ middle: Middle{ inner: null } };
}