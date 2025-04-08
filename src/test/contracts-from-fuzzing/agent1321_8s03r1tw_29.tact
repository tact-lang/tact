struct InnerOpt {
    foo: Int?;
    bar: Bool?;
}

contract DoubleOpt {
    data: InnerOpt?;
    init() {
        self.data = null;
    }
}