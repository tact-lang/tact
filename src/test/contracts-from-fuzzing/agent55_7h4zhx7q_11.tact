struct Point {
    x: Int;
    y: Int;
}

fun getPoint() : Point {
    return Point { x: 10, y: 20 };
}

contract TestFieldAccess {
    receive() {
        dump(getPoint().x);
    }
}
