primitive Int;

trait BaseTrait {

}

struct S {
    x: Int;
}

fun function() {
    let s: S = S{ x: 1 };
    s.x();
}