struct OptStruct {
    val: Int;
}

contract OptionalStructField {
    data: OptStruct?;

    init() {
        self.data = null;
    }
}