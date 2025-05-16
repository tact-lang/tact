struct Inner {
    foo: Int = 77;
}

struct Outer {
    maybeInner: Inner?;
    val: Int;
}

contract OptStructAssigned {
    outer: Outer = Outer{
        maybeInner: Inner{},
        val: 99,
    };
}