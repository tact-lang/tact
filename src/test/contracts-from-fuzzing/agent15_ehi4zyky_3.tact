struct A {
    a: Int;
    b: Int;
}

fun main() : Int {
    let s = A{ a: 10, b: 20 };
    return s.a + s.b; // Expected: 30
}
