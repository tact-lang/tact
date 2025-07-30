struct Inner {
    num: Int = 0;
}

struct Outer {
    maybeInner: Inner? = null;
}

contract OptOptChain {
    outer: Outer? = null;
}