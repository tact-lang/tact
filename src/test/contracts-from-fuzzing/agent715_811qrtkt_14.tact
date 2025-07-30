struct Holder {
    value: Int;
    desc: String;
}

contract NullableStructField {
    storage: Holder?;
    init() {
        self.storage = null;
    }
}