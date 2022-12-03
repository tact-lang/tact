primitive Int;
primitive Bool;
primitive Cell;

struct Point {
    x: Int;
    y: Int;
}

fun isZero(p: Point): Bool {
    return p.x == 0 && p.y == 0;
}

fun packPoint(p: Point): Cell {
    return abi.pack_cell(p);
}