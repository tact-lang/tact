contract OptionalStructWithDefaults {
    opt: Inner?;

    init() {
        self.opt = null;
    }
}

struct Inner {
    val: Int = 100;
}