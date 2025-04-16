struct S1 {
    x: Int;
}

contract OptionalStructField {
    optS: S1?;

    init() {
        self.optS = null;
    }
}