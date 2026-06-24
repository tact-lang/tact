struct ComplexInner {
    a: Int;
    b: Bool;
    c: String?;
}

contract Test {
    nested: ComplexInner = ComplexInner{a: 1, b: true};
}
