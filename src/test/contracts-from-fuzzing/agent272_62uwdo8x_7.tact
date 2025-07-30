struct InnerOpt {
    val: Int = 42;
}

contract TestOptionalStructField {
    data: InnerOpt? = null;

    init() {
        self.data = InnerOpt{ val: 100 };
    }
}