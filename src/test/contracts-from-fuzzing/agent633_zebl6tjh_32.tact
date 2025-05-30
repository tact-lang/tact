struct X {
    a: Int;
}

struct Y {
    b: Int;
    x: X;
}

contract CrossNested {
    yy: Y = Y{ b:1, x: X{a:2} };
}