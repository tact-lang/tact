struct DataBundle {
    count: Int;
    flag: Bool;
}

contract OptionalStructField {
    bundle: DataBundle?;

    init() {
        self.bundle = null;
    }
}
