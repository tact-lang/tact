struct SubStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    val: SubStruct?;

    init() {
        self.val = null;
    }
}
