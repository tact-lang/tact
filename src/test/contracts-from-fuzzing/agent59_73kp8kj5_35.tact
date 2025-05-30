struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract DirectWithStructDefaults {
    s: S = S{ a: 1, b: true, c: "hello" };
}
