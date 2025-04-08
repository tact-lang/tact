struct InnerOpt {
    a: Int? = null;
    b: String? = "hello";
    c: Bool? = false;
}

contract HasOpt {
    optField: InnerOpt? = null;

    init() {
        self.optField = InnerOpt{ a: null, b: "test", c: true };
    }
}