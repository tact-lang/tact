struct Simple {
    a: Int;
    b: Int = 5;
}

fun main(): Int {
    let s = Simple{ a: 10 };
    return s.a + s.b;
}
