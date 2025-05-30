struct ReqS {
    a: Int;
    b: Bool;
}

contract OptionalStructField {
    val: ReqS?;

    init() {
        self.val = null;
    }
}