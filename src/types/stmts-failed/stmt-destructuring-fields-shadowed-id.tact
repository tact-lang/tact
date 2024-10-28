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
    let x = 0;
    let S { a: x, b: b, c: c } = s;
    return x + b + c;
}