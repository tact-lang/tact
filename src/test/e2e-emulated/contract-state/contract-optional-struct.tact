struct S {
    a: Int;
    b: Int;
}

contract TestGetterOptional {
    s: S? = S { a: 1, b: 2 };

    receive() {}

    get fun S(): S? { return self.s }
}
