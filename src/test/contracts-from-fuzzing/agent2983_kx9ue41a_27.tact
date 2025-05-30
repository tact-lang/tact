struct NS {
    a: Int;
}

struct SW {
    inner: NS;
}

contract OptionalNestedStructField {
    opt: SW?;

    init() {
        self.opt = null;
    }
}