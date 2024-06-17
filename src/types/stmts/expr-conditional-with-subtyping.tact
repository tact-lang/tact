primitive Int;
primitive Bool;
primitive Cell;

fun foo1(x: Int?): Int? {
    let cond: Bool = true;
    return cond ? 42 : x;
}

fun foo2(x: Int?): Int? {
    let cond: Bool = true;
    return cond ? x : 42;
}

fun foo3(): Int? {
    let cond: Bool = true;
    return cond ? null : 42;
}

fun foo4(): Int? {
    let cond: Bool = true;
    return cond ? 42 : null;
}

fun foo5(): Int {
    let cond: Bool = true;
    let baz = cond ? 42 : null;
    return baz!!;
}

fun bar1(m: map<Int, Int>): map<Int, Int> {
    let cond: Bool = true;
    return cond ? null : m;
}

fun bar2(m: map<Int, Int>): map<Int, Int> {
    let cond: Bool = true;
    return cond ? m : null;
}

struct Bar {
    a: Cell?;
}

struct Baz { b: Int; }

fun baz(x: Cell?): Bar {
    let cond: Bool = true;
    return Bar {
        a: cond ? Baz { b: 42 }.toCell() : x
    };
}
