struct S {
    a: Int;
}

contract NullableStructField {
    s: S?;

    init() {
        self.s = null;
    }
}