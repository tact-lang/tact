struct Inner {
    a: Int;
}

contract DefaultNested {
    f: Inner = Inner{ a: 5};
}