// Test contract constant with struct containing optional fields
struct Point {
    x: Int;
    y: Int;
    label: String?;
}

contract TestContract {
    const ORIGIN: Point = Point{x:0,y:0,label:null};
    get fun originY(): Int {
        return self.ORIGIN.y;
    }
}
