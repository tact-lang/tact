struct Outer {
    a: Int;
    inner: Inner;
}

struct Inner {
    b: Int;
    flag: Bool;
}

contract NestedDefault {
    val: Outer = Outer{
        a: 1,
        inner: Inner{
            b: 2,
            flag: true,
        }
    };
}