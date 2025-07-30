struct InnerOpt {
    value: Int?;
}

contract Test12 {
    optField: InnerOpt?;

    init() {
        self.optField = null;
    }
}
