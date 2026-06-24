struct SimpleStruct { x: Int; y: Int; }

contract TestContract {
    point: SimpleStruct;

    init() {
        self.point = SimpleStruct{ x: 1, y: 2 };
    }
}