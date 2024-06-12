primitive Int;
primitive Bool;

fun foo1(x: Int?): Int {
    let cond: Bool = true;
    return cond ? 42 : x;
}

fun foo2(x: Int?): Int {
    let cond: Bool = true;
    return cond ? x : 42;
}
