struct Inner {
    f: Int;
}

contract OptStructField {
    data: Inner?;
    init() {
        self.data = null;
    }
}