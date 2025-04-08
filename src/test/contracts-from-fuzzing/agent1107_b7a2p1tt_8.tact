struct Inner {
    val: Int;
}

contract OptStructField {
    innerOpt: Inner?;

    init() {
        self.innerOpt = null;
    }
}