struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract NestedOptPersist {
    outer: InnerOpt?;

    init() {
        self.outer = null;
    }

    receive() {}
}