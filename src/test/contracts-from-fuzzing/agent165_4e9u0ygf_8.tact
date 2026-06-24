struct Inner {
    val: Int;
    valOpt: Bool?;
}

contract InitOmitOpt {
    data: Inner;

    init() {
        self.data = Inner{
            val: 42,
        };
    }
}