struct Simple { x: Int; y: Int }

contract Test {
    point: Simple;

    init() {
        self.point = Simple{ x: 1, y: 2 };
    }
}