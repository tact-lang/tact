struct Inner {
    x: Int;
}

struct Outer {
    data: Inner?;
}

contract NestedOptStruct {
    val: Outer = Outer{ data: null };
}