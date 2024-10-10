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
    let S { a, b, c } = s;
    let S { a: a1, _, _ } = s;
    let S { _, b: b1, _ } = s;
    let S { _, _, c: c1 } = s;
    let S { a: a2, b: b2, _ } = s;
    let S { a: a3, _, c: c3 } = s;
    let S { _, b: b4, c: c4 } = s;

    let m = M{ a: 1, b: 2 };
    let M { a: a_m, b: b_m } = m;

    return a + b + c + a1 + b1 + c1 + a2 + b2 + a3 + c3 + b4 + c4 + a_m + b_m;
}