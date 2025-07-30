// testing contract field with optional struct default null
struct Point {
    x: Int;
    y: Int;
}

contract TestContract {
    pt: Point?;

    init() {
        self.pt = null;
    }
}