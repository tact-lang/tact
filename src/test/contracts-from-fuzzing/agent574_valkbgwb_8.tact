struct InnerWithDefaults {
    foo: Int = 7;
    bar: Bool = true;
    msg: String = "hi";
}

contract OptionalDefaults {
    optVal: InnerWithDefaults?;

    init() {
        self.optVal = null;
    }

    receive() {
        if (self.optVal != null) {
            dump(self.optVal!!.foo);
        }
    }
}