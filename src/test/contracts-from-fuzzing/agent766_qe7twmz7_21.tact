struct LeafMost {
    foo: Int? = null;
    bar: String = "bar";
}

struct Mid {
    leaf: LeafMost? = null;
}

struct Top {
    mid: Mid? = null;
}

contract OptDeepNest {
    persistent: Top? = null;
}