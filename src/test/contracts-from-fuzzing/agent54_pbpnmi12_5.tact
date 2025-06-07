struct OptInner {
    val: Int?;
}

contract OptionalStructField {
    field: OptInner;

    init() {
        self.field = OptInner{ val: null };
    }
}