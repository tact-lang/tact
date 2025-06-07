struct HasOptional {
    val: Int?;
}

contract OptStructField {
    s: HasOptional?;

    init() {
        self.s = null;
    }
}