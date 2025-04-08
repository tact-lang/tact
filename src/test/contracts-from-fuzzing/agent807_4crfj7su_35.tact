// nested structs, outer optional, all default provided
struct Inner {
    x: Int = 1;
}

struct Outer {
    inner: Inner = Inner{ x:5 };
}

contract OptOuter {
    data: Outer? = null;
}