struct InnerOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalNested {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}