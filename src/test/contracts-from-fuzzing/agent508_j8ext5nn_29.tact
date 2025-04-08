struct InnerOpt {
    v: Int?;
}

contract Test {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}