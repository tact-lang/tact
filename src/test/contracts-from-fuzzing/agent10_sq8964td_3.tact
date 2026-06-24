struct Point {
    x: Int;
    y: Int;
}

struct Line {
    start: Point;
    end: Point;
}

fun test() {
    let line = Line { start: Point { x: 1, y: 2 }, end: Point { x: 3, y: 4 } };
    let Point { x, y } = line.start;
    // Using x and y, although not printed, just to test destructuring
    let _ = x + y;
}
