struct Inner1 { x: Int; y: Bool }

contract TestContract {
    point: Inner1;

    init() {
        self.point = Inner1{ x: 1, y: true };
    }
}