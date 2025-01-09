primitive Int;
primitive Bool;

fun foo(x: Int?): Int {
    let cond: Bool = true;
    return cond ? 42 : x;
}
