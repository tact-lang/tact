struct GrandChild {
    val: Int;
}

struct Child {
    inner: GrandChild;
}

contract DeepNestedStructField {
    field: Child = Child{ inner: GrandChild{ val: 42 } };
}