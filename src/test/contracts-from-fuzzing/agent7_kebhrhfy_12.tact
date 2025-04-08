struct InnerStruct {
    val: Int;
}

contract OptionalStructField {
    item: InnerStruct?;
    init() {
        self.item = null;
    }
}