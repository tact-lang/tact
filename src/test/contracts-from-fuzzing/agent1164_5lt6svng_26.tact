struct OptionalS {
    a: Int;
    b: String?;
}

contract OptStructField {
    f: OptionalS?;

    init() {
        self.f = null;
    }
}