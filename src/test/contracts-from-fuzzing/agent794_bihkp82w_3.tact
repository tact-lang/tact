struct Inner {
    x: Int = 7;
    y: Bool = true;
}

contract OptStructField {
    innerOpt: Inner? = null;
    init() {}
}