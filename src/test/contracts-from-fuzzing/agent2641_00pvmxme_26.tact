struct InnerS {
    v: Int;
}

contract OptionalStructField {
    data: InnerS?;

    init() {
        self.data = null;
    }
}