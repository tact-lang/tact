struct InnerStruct {
    val: Int;
}

contract OptionalStructField {
    s: InnerStruct?;

    init() {
        self.s = null;
    }
}