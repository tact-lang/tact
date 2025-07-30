struct Inner {
    b: Int?;
}

struct Outer {
    a: Inner;
}

contract DeepNestedOptional {
    val: Outer = Outer{a: Inner{b: null}};
}
