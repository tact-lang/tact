struct S {
    a: Int;
}

contract OptStructField {
    data: S?;

    init() {
        self.data = null;
    }
}