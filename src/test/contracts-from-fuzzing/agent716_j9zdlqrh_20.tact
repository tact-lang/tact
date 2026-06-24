struct Deep {
    inner1: Int?;
    inner2: Bool?;
}

contract OptionalStructField {
    val: Deep?;

    init() {
        self.val = null;
    }
}