struct Bar {
    s: String;
}

contract NullableStructField {
    val: Bar?;
    init() {
        self.val = null;
    }
}