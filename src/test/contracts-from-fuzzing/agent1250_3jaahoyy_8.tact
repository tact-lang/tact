struct NestedOptional {
    nest: Inner?;
}

struct Inner {
    val: Int;
}

contract TestContract {
    no: NestedOptional = NestedOptional{nest: Inner{val:7}};
}