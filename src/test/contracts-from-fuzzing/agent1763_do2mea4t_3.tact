struct OptInner {
    data: String?;
}

contract OptionalStructField {
    val: OptInner;

    init() {
        self.val = OptInner{ data: null };
    }
}