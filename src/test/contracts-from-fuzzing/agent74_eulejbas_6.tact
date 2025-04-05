struct Point { x: Int; y: Int; }

fun getX(p: Point): Int {
    return p.x;
}

contract TestFieldAccess {
    receive() {
        let pt = Point { x: 10, y: 20 };
        getX(pt);
    }
}
