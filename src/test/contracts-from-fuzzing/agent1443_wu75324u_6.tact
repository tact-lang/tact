struct DeepOpt {
    val: Int?;
    inner: Inner?;
}

struct Inner {
    msg: String;
    flag: Bool;
}

contract OptionalNested {
    store: DeepOpt;

    init() {
        self.store = DeepOpt{
            val: null,
            inner: null,
        };
    }
}