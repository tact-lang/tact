struct OptionalStruct {
    x: Int;
}

contract OptStructField {
    item: OptionalStruct?;
    init() {
        self.item = null;
    }
}