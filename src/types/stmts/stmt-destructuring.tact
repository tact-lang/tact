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
    let { a1, _, _ } = s;
    let { _, b1, _ } = s;
    let { _, _, c1 } = s;
    let { a2, b2, _ } = s;
    let { a3, _, c3 } = s;
    let { _, b4, c4 } = s;

    let m = M{ a: 1, b: 2 };
    let { a_m, b_m } = m;

    return a + b + c + a1 + b1 + c1 + a2 + b2 + a3 + c3 + b4 + c4 + a_m + b_m;
}