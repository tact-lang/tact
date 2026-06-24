struct OptStruct {
    z: Int;
}

contract OptionalStructField {
    item: OptStruct?;

    init() {
        self.item = null;
    }
}