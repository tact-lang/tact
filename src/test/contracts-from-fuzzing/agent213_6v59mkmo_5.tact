struct NestedOptional {
    inner: Int?;
}

contract Test {
    no: NestedOptional?;

    init() {
        self.no = null;
    }
}