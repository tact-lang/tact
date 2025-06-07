struct InnerOpt {
    x: Int?;
    y: Int;
}

contract Test {
    data: InnerOpt;

    init() {
        self.data = InnerOpt{x: null, y: 1};
    }
}