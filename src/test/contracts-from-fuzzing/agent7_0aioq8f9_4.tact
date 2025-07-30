struct Point { x: Int; y: Int }

fun getPoint(): Point {
    return Point { x: 10, y: 20 };
}

fun testDestructure() {
    let Point { x, y } = getPoint();
    dump(x);
    dump(y);
}

contract Test {
    receive() {
        testDestructure();
    }
}
