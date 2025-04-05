struct Point { x: Int; y: Int }

fun get_point(): Point {
    return Point { x: 1, y: 2 };
}

contract DestructuringTest {
    receive() {
       let Point { x, y } = get_point();
       dump(x);
       dump(y);
    }
}
