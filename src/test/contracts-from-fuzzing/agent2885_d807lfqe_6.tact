struct Inner {
    s: String;
    b: Bool;
}

contract OptStructField {
    sopt: Inner?;

    init() {
        self.sopt = null;
    }
}