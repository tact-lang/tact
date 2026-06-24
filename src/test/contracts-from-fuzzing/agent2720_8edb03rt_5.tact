struct Deep {
    pt: Inner?;
}

struct Inner {
    x: Int;
    y: Int;
}

contract Test {
    d: Deep = Deep{ pt: null };
}