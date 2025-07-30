struct Inner {
    value: Int;
}

struct Outer {
    nested: Inner?;
}

contract OptionalNested {
    data: Outer?;
}
