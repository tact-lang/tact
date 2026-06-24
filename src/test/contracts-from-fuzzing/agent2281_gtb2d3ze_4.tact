struct Inner {
    foo: Bool;
    bar: String;
    val: Int?;
}

contract OptionalNest {
    innerOpt: Inner?;

    init() {
        self.innerOpt = Inner {
            foo: true,
            bar: "ok",
            val: null
        };
    }
}