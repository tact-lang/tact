struct S {
    val: Int;
}

contract NullableField {
    data: S?;

    init() {
        self.data = null;
    }
}