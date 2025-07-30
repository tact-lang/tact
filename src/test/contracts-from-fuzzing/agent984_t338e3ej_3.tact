struct Deep {
    a: Int;
}

struct Mid {
    d1: Deep;
    d2: Deep?;
}

struct Outer {
    m1: Mid;
    m2: Mid?;
}

contract DeepNestedContract {
    o: Outer = Outer{
        m1: Mid{d1: Deep{a: 1}, d2: null},
        m2: null
    };
}