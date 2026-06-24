struct NoSemi { a: Int; b: Int }

fun test_no_semi() : Int {
    let ns = NoSemi{ a: 10, b: 20 };
    return ns.a + ns.b;
}
