struct Inner {
    val: Int = 10;
    opt: Bool?;   // default null
    nested: String = "hi";
}

contract TestContract {
    info: Inner;

    init() {
        self.info = Inner{
            val: 99,
            nested: "there",
        };
    }
}