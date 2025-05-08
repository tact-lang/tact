struct EmptyNested {
    inner1: Inner1;
    inner2: Inner2;
}

struct Inner1 {
    val1: Int;
}

struct Inner2 {
    val2: Bool;
}

contract NullNestedFields {
    val: EmptyNested? = null;

    init() {}
}