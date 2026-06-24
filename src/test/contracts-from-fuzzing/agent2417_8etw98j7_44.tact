struct Inner {
    val: Int?;
}

contract OptionalStructField2 {
    field: Inner?;

    init() {
        self.field = Inner{ val: null };
    }
}
