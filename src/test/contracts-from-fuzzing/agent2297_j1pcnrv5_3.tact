struct InnerOpt {
    x: Int?;
    y: Int?;
}

contract Test {
    optField: InnerOpt;

    init() {
        self.optField = InnerOpt{x: null, y: 10};
    }
}