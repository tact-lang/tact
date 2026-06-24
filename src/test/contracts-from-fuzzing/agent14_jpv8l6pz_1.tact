struct Point {
    x: Int;
    y: Int;
}

contract Test {
    fun get_point() : Point {
        return Point{x: 10, y: 20};
    }
}