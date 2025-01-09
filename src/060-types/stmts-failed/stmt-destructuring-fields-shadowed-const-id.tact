primitive Int;

trait BaseTrait {
    
}

struct S {
    a: Int;
    b: Int;
    c: Int;
}

const x: Int = 5;

fun testFunc(): Int {
    let s = S{ a: 1, b: 2, c: 3 };
    let S { a: x, b: b, c: c } = s;
    return x + b + c;
}