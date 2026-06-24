struct Coordinates { x: Int; y: Int }

contract TestContract {
    point: Coordinates;

    init() {
        self.point = Coordinates{ x: 4, y: 2 };
    }
}