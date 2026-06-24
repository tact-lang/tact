struct OptionalStruct {
    foo: Int;
    bar: Bool?;
}

contract OptStructField {
    val: OptionalStruct?;

    init() {
        self.val = null;
    }
}