struct Child {
    foo: Int;
}

struct Parent {
    bar: Child?;
}

contract OptionalStructField {
    p: Parent = Parent{ bar: null };
}