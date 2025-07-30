struct Deep {
    a: Int;
    b: Int?;
}

struct Middle {
    d: Deep;
    c: Int;
}

struct Outer {
    m: Middle;
    n: Int;
}

contract DeepContract {
    field: Outer = Outer{m: Middle{d: Deep{a:1, b:2}, c:3}, n:4};
}