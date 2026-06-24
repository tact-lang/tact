struct OptionalStructField {
    s: String;
}

contract OptionalStructFieldContract {
    data: OptionalStructField?;

    init() {
        self.data = null;
    }
}