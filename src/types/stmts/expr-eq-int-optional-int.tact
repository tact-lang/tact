primitive Int;
primitive Bool;

fun foo(x: Int?, y: Int): Bool {
    return x == y || y == x || x == x;
}
