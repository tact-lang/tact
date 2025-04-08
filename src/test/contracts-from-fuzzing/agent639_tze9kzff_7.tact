struct InnerOption {
    num: Int?;
    flag: Bool?;
}

contract NestedOptionalField {
    info: InnerOption?;

    init() {
        self.info = null;
    }

    receive() {}
}