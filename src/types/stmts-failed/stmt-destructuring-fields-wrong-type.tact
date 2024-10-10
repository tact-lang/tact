primitive Int;

trait BaseTrait {
    
}

struct S1 {
    x: Int;
    y: Int;
}

struct S2 {
    x: Int;
    y: Int;
}

fun testFunc(): Int {
    let S1 {x, y} = S2 {x: 42, y: 43};
    return x + y;
}