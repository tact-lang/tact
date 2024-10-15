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
    let S {_, b} =  s;
    return b;
}