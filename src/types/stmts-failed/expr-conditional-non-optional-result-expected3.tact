primitive Int;
primitive Bool;

fun foo3(): Int {
    let cond: Bool = true;
    let baz: Int = cond ? 42 : null;
    return baz!!;
}
