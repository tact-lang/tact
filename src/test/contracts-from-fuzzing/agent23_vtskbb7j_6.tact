struct Point {
    x: Int;
    y: Int;
}

contract TestFieldAccess {
    receive() {
         let p = Point { x: 10, y: 20 };
         let sum = p.x + p.y;           // tests field access
         let nested = (p.x + p.y) * 2;    // tests parenthesized expressions
    }
}
