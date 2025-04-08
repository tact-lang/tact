struct Deep {
    pt: Inner;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    d: Deep = Deep{ pt: Inner{ x:3, y:4 } };
}