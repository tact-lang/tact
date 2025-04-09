struct DeepPoint {
    x: Int as int64;
    y: Int as int64;
}

contract NestedFieldsTest {
    point: DeepPoint;

    init() {
        self.point = DeepPoint{ x: 1, y: 2 };
    }
}