// Test having contract constant of struct type
struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    const ORIGIN: Point = Point{x:0,y:0};
    get fun originX(): Int {
        return self.ORIGIN.x;
    }
}
