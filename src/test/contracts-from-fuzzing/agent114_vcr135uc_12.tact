struct Small {
    val: Int;
    text: String;
}

contract NullableStructField {
    foo: Small?;

    init() {
        self.foo = null;
    }
}
