struct Ints {
    x: Int;
    y: Int;
    z: Int;
}

contract OptionalStructField {
    storage: Ints?;

    init() {
        self.storage = null;
    }
}