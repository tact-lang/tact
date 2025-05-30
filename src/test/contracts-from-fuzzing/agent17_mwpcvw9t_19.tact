struct Inner {
    a: Int;
}

struct Outer {
    s1: Inner;
    s2: Inner;
    s3: Inner;
    s4: Inner;
    s5: Inner;
}

contract MultStructs {
    big: Outer = Outer{
        s1: Inner{a:1},
        s2: Inner{a:2},
        s3: Inner{a:3},
        s4: Inner{a:4},
        s5: Inner{a:5},
    };
}