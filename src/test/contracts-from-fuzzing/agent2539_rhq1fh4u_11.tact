struct OptionalStruct {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    val: OptionalStruct?;

    init() {
        self.val = OptionalStruct{a: 5, b: true};
    }
}