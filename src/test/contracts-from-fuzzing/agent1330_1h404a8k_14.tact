struct Point {
    x: Int = 5;
    y: Int = 10;
}

contract ParamNested(
    p: Point,
) {
    receive() {}
}
