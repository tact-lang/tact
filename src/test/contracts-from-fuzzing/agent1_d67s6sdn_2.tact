struct Basic {
    a: Int;
    b: Int;
}

fun test_basic() : Int {
    let s = Basic{ a: 1, b: 2 };
    return s.a + s.b;
}
