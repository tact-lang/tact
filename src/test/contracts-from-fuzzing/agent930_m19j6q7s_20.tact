struct Inner {
    a: Int;
}

struct Middle {
    b: Inner;
}

struct Outer {
    c: Middle;
}

contract DefaultMid {
    data: Outer = Outer{ c: Middle{ b: Inner{a:10} } };
}