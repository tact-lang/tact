struct Inner {
    flag: Bool;
    comment: String;
}

contract OptionalStructField {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}