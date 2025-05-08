struct SimpleStruct { x: Int; y: Int; }

contract SingleStructField {
    point: SimpleStruct;

    init() {
        self.point = SimpleStruct{ x: 1, y: 2 };
    }
}