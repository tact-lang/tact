primitive Int;

trait BaseTrait {
    
}

struct S {
    a: Int;
    b: Int;
    c: Int;
}

message M {
    a: Int;
    b: Int;
}

fun testFunc(): Int {
    let s = S{ a: 1, b: 2, c: 3 };
    let { a, b, c } = s;
    let { a: a1, _, _ } = s;
    let { _, b: b1, _ } = s;
    let { _, _, c: c1 } = s;
    let { a: a2, b: b2, _ } = s;
    let { a: a3, _, c: c3 } = s;
    let { _, b: b4, c: c4 } = s;

    let m = M{ a: 1, b: 2 };
    let { a: a_m, b: b_m } = m;

    return a + b + c + a1 + b1 + c1 + a2 + b2 + a3 + c3 + b4 + c4 + a_m + b_m;
}