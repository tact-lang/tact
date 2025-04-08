struct Point { x: Int; y: Int; }

contract DestructTest {
    pt: Point;

    init() {
        self.pt = Point { x: 5, y: 10 };
    }

    get fun sum(): Int {
        let Point { x, y } = self.pt;
        return x + y;
    }
}