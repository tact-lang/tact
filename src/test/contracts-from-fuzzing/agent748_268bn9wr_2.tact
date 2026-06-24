struct Inner {
    x: Int;
    y: Bool;
}

contract TestNestedStructField {
    coord: Inner;

    init() {
        self.coord = Inner{
            x: 42,
            y: true,
        };
    }
}
