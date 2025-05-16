struct Inner {
    val: Int = 5;
}

struct Outer {
    inner: Inner?;
    other: Int = 42;
}

contract ExplicitNullOpt {
    data: Outer = Outer{
        inner: null,
        other: 10
    };
}