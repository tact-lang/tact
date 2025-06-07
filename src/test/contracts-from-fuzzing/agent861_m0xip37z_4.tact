struct OptNest {
    val: Int?;
}

contract OptionalStructField {
    s: OptNest;

    init() {
        self.s = OptNest{ val: null };
    }
}
