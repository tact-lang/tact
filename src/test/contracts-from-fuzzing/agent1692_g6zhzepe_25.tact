struct InnerMost {
    flag: Bool;
}

struct Middle {
    inner: InnerMost;
}

struct Outer {
    mid: Middle;
}

contract BoolsInDeepStruct {
    s: Outer = Outer{ mid: Middle{ inner: InnerMost{ flag: true } } };
}