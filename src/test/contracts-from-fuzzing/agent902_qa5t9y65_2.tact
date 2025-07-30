struct Inner {
    x: Int;
    y: Bool;
    z: String;
}

contract NestedStructField {
    point: Inner;

    init() {
        self.point = Inner{ x: 1, y: false, z: "hello" };
    }
}