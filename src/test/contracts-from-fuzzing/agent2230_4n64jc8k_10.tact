struct OptionalStructField {
    val1: Int;
    val2: Bool;
}

contract OptionalFieldContract {
    optionalData: OptionalStructField?;

    init() {
        self.optionalData = OptionalStructField{ val1: 5, val2: false };
    }
}