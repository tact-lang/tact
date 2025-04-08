struct InnerOpt {
    v: Int = 10;
}

struct Outer {
    inner: InnerOpt?;
}

contract OptionalStructDefaulted {
    outer: Outer = Outer{ inner: null };
}