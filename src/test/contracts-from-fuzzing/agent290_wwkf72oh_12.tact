struct NestedOptional {
    inner: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    data: NestedOptional = NestedOptional{inner: null};
}
