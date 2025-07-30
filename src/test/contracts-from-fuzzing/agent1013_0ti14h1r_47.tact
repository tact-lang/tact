struct S { a: Int; }
contract DeepDefault {
    f: S = defaultS();
}

fun defaultS(): S {
    return S{ a: 42 };
}
