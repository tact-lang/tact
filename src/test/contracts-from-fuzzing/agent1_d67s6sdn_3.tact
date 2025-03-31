struct Defaults {
    a: Int = 10;
    b: Int = 20;
    c: Int;
}

fun test_defaults() : Int {
    let d = Defaults{ c: 30 };
    return d.a + d.b + d.c;
}
