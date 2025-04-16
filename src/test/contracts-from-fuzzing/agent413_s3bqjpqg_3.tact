struct Inner {
    x: Int;
}

contract WithNestedStruct {
    s: Inner = Inner{x: 1};
}