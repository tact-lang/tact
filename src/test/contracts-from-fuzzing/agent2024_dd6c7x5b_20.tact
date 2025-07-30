struct InnerOpt {
    f: Int?;
}

contract NestedEmptyOpt {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}