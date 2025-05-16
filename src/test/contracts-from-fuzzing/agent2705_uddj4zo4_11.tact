struct S2 {
    val1: Int;
}

struct S1 {
    nested: S2;
}

contract OptionalNested {
    option: S1? = null;
}