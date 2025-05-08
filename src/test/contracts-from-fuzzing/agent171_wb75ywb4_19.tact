struct OptOpt {
    foo: Int?;
    bar: Bool?;
}

contract OptStructField {
    data: OptOpt?;
    init() {
        self.data = null;
    }
}