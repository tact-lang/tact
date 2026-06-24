struct Dummy {
    x: Int;
}

contract NullableStructField {
    opt: Dummy?;
    init() {
        self.opt = null;
    }
}
