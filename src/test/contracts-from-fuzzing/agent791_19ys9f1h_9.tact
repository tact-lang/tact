struct Inner {
    val: Int?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    foo: Outer = Outer{ inner: Inner{ val: null } };
}
