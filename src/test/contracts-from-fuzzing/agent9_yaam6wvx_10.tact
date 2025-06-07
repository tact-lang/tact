/// Snippet 10: Nested Defaults Test
struct Inner {
    x: Int = 5;
    y: Int = 10;
}

struct Outer {
    inn: Inner;
    z: Int;
}

fun main() : Int {
    let o = Outer{ inn: Inner{}, z: 20 };
    // Expected: 5 + 10 + 20 = 35
    return o.inn.x + o.inn.y + o.z;
}
