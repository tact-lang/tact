struct InnerOptional {
    a: Int?;
    b: String?;
}

contract DoubleOptional {
    data: InnerOptional?;
    init() {
        self.data = null;
    }
}