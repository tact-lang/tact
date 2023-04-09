primitive Int;
primitive Bool;
primitive Cell;

trait BaseTrait {
    
}

struct Point {
    x: Int;
    y: Int;
}

fun isZero(p: Point): Bool {
    return p.x == 0 && p.y == 0;
}

fun packPoint(p: Point): Cell {
    return p.toCell();
}