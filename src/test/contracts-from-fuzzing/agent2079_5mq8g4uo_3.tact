struct Point {
    x: Int;
    y: Int;
}

struct OptionalNest {
    p: Point?;
}

contract TestContract {
    data: OptionalNest;
    init() {
       self.data = OptionalNest{p: Point{x:1, y:2}};
    }
}