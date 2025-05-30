struct Inner { x: Int; y: Int; }
contract NestedStructField {
    coords: Inner;
    init() {
        self.coords = Inner{ x: 1, y: 2 };
    }
}