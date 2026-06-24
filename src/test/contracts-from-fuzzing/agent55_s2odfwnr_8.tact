contract OptStructField {
    s: Inner?;

    init() {
        self.s = null;
    }
}

struct Inner {
    val: Int = 7;
    flag: Bool = false;
}
