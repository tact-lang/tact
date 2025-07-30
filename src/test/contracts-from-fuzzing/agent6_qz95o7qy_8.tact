struct Point {
    x: Int;
    y: Int;
}

fun destructTest() {
    // Destructuring assignment: unpacking fields from a struct
    let Point { x, y } = Point { x: 10, y: 20 };
}
