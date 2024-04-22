primitive Int;
trait BaseTrait {
}

struct A {
    x: Int;
    y: Int;
}

const a: Int = 5;
const b: Int = 6;

fun function() {
    let D: A = A { x: a, b };
}