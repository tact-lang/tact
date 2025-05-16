struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestOptionals {
    data: Outer = Outer{ inner: Inner{ val: null } };
}
