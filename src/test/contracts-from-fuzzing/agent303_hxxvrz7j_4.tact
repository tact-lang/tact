struct OptionalStructField {
    x: Int;
    y: Int;
}

contract OptionalTest {
    point: OptionalStructField?;

    init() {
        self.point = null;
    }
}