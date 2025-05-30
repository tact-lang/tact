struct Point { x: Int; y: Int; }

fun destructure(): Int {
    let Point { x, y } = Point { x: 10, y: 20 };
    return x + y;
}

contract DestructuringTest {
    receive() {
         destructure();
    }
}
