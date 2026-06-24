struct OptionalStruct {
    s: String;
}

contract OptStructField {
    val: OptionalStruct?;

    init() {
        self.val = null;
    }
}