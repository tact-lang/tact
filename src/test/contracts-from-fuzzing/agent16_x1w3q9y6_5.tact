struct Point { x: Int; y: Int; }

fun getPoint(): Point { return Point { x: 10, y: 20 } }

fun main(): Int {
    let Point { x, y, } = getPoint();
    dump(x);
    dump(y);
    return x + y;
}
