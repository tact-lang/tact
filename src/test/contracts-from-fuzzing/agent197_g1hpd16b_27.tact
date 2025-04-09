struct X {
    y: Int;
}

struct Wrap {
    inner: X;
}

contract OptWrap {
    w: Wrap? = null;
}