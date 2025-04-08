struct InnerOptional {
    val: Int?;
}

contract OptionalStructField2 {
    data: InnerOptional?;

    init() {
        self.data = null;
    }
}