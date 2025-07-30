struct A {
    flag: Bool;
    strVal: String;
}

contract InlineDefaults {
    a: A = A{ flag: true, strVal: "val" };
}