struct OptionalStruct {
    num: Int;
    text: String;
}

contract OptionalStructField {
    val: OptionalStruct?;

    init() {
        self.val = null;
    }
}