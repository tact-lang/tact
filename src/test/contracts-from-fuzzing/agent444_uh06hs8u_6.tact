struct OptStruct {
    val: Int?;
    flag: Bool;
}

contract OptionalStructField {
    field: OptStruct?;

    init() {
        self.field = null;
    }
}