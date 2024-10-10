primitive Int;

trait BaseTrait {
    
}

struct S {
    a: Int;
    b: Int;
    c: Int;
}

fun testFunc(): Int {
    let s = S{ a: 1, b: 2, c: 3 };
    let m: map<Int, Int> = emptyMap();
    let S { a, b, c } = m;
    return a + b + c;
}