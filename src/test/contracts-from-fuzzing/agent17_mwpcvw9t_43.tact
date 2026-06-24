struct Inner {
    x: Int;
}

contract DefaultNested {
    nested: Inner = Inner{x:0};
}