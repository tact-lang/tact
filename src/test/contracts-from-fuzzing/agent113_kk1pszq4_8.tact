struct NestedOptional {
    x: Int?;
    y: Int?;
}

contract NestedOptContract {
    data: NestedOptional?;

    init() {
        self.data = null;
    }
}