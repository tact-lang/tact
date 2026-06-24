struct InnerOptional {
    name: String?;
}

contract OptionalStructField {
    val: InnerOptional;

    init() {
        self.val = InnerOptional{ name: null };
    }
}