// optional struct field initialized to null explicitly
struct Inner {
    num: Int;
}

contract OptionalStructField {
    innerOpt: Inner?;
    init() {
        self.innerOpt = null;
    }
}
