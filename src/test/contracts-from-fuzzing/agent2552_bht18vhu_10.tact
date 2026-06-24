struct Deep1 {
    a: Int;
}

struct Deep2 {
    d1: Deep1?;
}

struct Deep3 {
    d2: Deep2?;
}

contract NestedOptionals {
    val: Deep3?;
}