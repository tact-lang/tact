struct Defaults {
    a: Int = 5;
    b: Int;
}

fun test_defaults() : Int {
    let d = Defaults { b: 10 };
    return d.a + d.b;
}
