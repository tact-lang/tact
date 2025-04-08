struct D {
    a: Int?;
    b: Bool?;
}

contract OptionalStructField {
    opt: D?;

    init() {
        self.opt = null;
    }
}