primitive Int;

trait BaseTrait {
    
}

struct S {
    a: Int;
    b: Int;
    c: Int;
}

fun testFunc(): Int {
    let s: S? = S{ a: 1, b: 2, c: 3 };
    let S { a, b, c } = s;
    return a + b + c;
}